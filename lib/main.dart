import 'dart:convert';

import 'package:check_in/global_binding/app_bindings.dart';
import 'package:check_in/models/notification/notification.dart';
import 'package:check_in/modules/home/controllers/home_controller.dart';
import 'package:check_in/modules/notification/controllers/notification_controller.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/global_service.dart';
import 'package:check_in/utils/dismiss_keyboard.dart';
import 'package:check_in/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'firebase_options.dart';

final BehaviorSubject<String?> notificationData = BehaviorSubject<String?>();
AndroidNotificationChannel? channel;
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

Future<void> main() async {
  if (kReleaseMode) {
    await dotenv.load(fileName: '.env.prod');
  } else {
    await dotenv.load(fileName: '.env.dev');
  }
  // await Upgrader.clearSavedSettings();
  WidgetsFlutterBinding.ensureInitialized();
  String initialRoute = AppPages.INITIAL;
  await GetStorage.init();

  FirebaseApp app = await Firebase.initializeApp(
      name: "check_in", options: DefaultFirebaseOptions.currentPlatform);
  await Get.putAsync(() => GlobalService().init());
  print('Initialized default app $app');

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
    provisional: true,
    carPlay: true,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
  );

  await flutterLocalNotificationsPlugin!
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel!);

  // Định nghĩa cài đặt khởi tạo cho Android và iOS cho thông báo nội bộ.
  // Đối với Android, nó xác định biểu tượng ứng dụng sẽ được sử dụng trong các thông báo.
  // Đối với iOS, nó yêu cầu quyền cho cảnh báo (alerts), biểu tượng (badges) và âm thanh (sound),
  // và xác định một hàm gọi lại (callback) khi nhận thông báo nội bộ.
  var androidInitSettings = AndroidInitializationSettings("app_icon");
  var iosInitSettings = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification);

  // Kết hợp cài đặt khởi tạo cho Android và iOS thành một đối tượng InitializationSettings duy nhất.
  var initSettings = InitializationSettings(
    android: androidInitSettings,
    iOS: iosInitSettings,
  );

// Khởi tạo plugin Flutter Local Notifications với cài đặt khởi tạo kết hợp.
// onSelectNotification được xác định là callback sẽ được kích hoạt khi người dùng chạm vào thông báo.
  flutterLocalNotificationsPlugin!.initialize(
    initSettings,
    onSelectNotification: onSelectNotification,
  );

// Lấy mã FCM và set bằng cách sử dụng hàm _setToken.
// Nếu xảy ra ngoại lệ (exception) trong quá trình lấy mã, nó bắt lỗi và đặt một mã trống.
  try {
    var fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      _setToken(fcmToken);
    }
  } catch (e) {
    print(e); // Catches all types of `Exception` and `Error`.
    _setToken("");
  }

// Lắng nghe các tin nhắn FCM được sử dụng để mở ứng dụng (khi ứng dụng đang ở chế độ background hoặc đã bị tắt).
  FirebaseMessaging.instance.getInitialMessage().then(
    (RemoteMessage? message) async {
      if (message != null &&
          (await Utils.getFcmId(message.messageId!)) == null) {
        Utils.setFcmId(message.messageId!);
        final globalService = Get.find<GlobalService>();
        globalService.navigateNotification.add(
          json.encode(message.data),
        );
      }
    },
  );

// Xử lý dữ liệu thông báo và thực hiện các hành động cụ thể dựa trên loại thông báo.
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      Map<String, dynamic> data = message.data;
      AndroidNotification? android = message.notification!.android;
      if (GetPlatform.isIOS) {
        final homeController = Get.find<HomeController>();
        final notificationController = Get.find<NotificationController>();

        homeController.initListMessage();
        notificationController.initData();
      }
      if (notification != null && android != null && !kIsWeb) {
        final globalService = Get.find<GlobalService>();
        globalService.notificationData.add(json.encode(data));
        flutterLocalNotificationsPlugin!.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel!.id, channel!.name,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'app_icon',
              importance: Importance.high,
            ),
          ),
          payload: json.encode(data),
        );
      }
    },
  );

// Lắng nghe các tin nhắn FCM được sử dụng để mở ứng dụng (khi ứng dụng đang ở chế độ background hoặc đã bị tắt).
  FirebaseMessaging.onMessageOpenedApp.listen(
    (RemoteMessage? message) {
      if (message != null) {
        final globalService = Get.find<GlobalService>();
        globalService.notificationData.add(json.encode(message.data));

        if (message.data['type'] != null && message.data['type'] == "1") {
          NotificationModel notify = NotificationModel.fromJson(message.data);
          Get.toNamed(Routes.CHECKIN, arguments: notify.id);
        } else if (message.data['type'] != null &&
            message.data['type'] == "2") {
          NotificationModel notify = NotificationModel.fromJson(message.data);
          Get.toNamed(Routes.GRADE, arguments: notify.id);
        } else if (message.data['type'] != null &&
            message.data['type'] == "3") {
          NotificationModel notify = NotificationModel.fromJson(message.data);
          Get.toNamed(Routes.NOTIFICATION_DETAIL, arguments: notify.id);
        }
        debugPrint('A new onMessageOpenedApp event was published!');
      }
    },
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

  tz.initializeTimeZones();

  runApp(
    DismissKeyboard(
      child: GetMaterialApp(
        localizationsDelegates: [
          // FlutterI18nDelegate(
          //   translationLoader: NetworkFileTranslationLoader(
          //     baseUri: Uri.https(
          //         dotenv.env['HOMEPAGE'] ?? "", DomainProvider.LANG_NETWORK),
          //     fallbackFile: DomainProvider.LANG_INITIAL,
          //     forcedLocale: Locale("vi"),
          //   ),
          //   missingTranslationHandler: (key, locale) {
          //     debugPrint(
          //       '--- Missing Key: $key, languageCode: ${locale?.languageCode}, ${dotenv.env['HOMEPAGE']}, ${DomainProvider.LANG_NETWORK}',
          //     );
          //   },
          // ),
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('vi', 'VI'),
          // ... other locales the app supports
        ],
        initialRoute: initialRoute,
        getPages: AppPages.routes,
        defaultTransition: Transition.rightToLeft,
        transitionDuration: Get.defaultDialogTransitionDuration,
        debugShowCheckedModeBanner: false,
        initialBinding: AppBinding(),
      ),
    ),
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage? message) async {
  await Firebase.initializeApp(
      name: "check_in", options: DefaultFirebaseOptions.currentPlatform);
}

_setToken(String token) {
  final globalService = Get.find<GlobalService>();
  globalService.token = token;
}

//received notification ios from foreground
Future onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) async {
  if (payload != null) {
    Map<String, dynamic>? result = json.decode(payload);

    if (result != null && result['id'] != null) {
      final globalService = Get.find<GlobalService>();
      globalService.notificationData.add(payload);

      //id: id của request
      //idNotification: id của Notification
      //type: 1: detail Need Approval, 2: detail My Request., 4: confirm, 5: bổ sung hồ sơ
      if (result['type'] != null && result['type'] == "1") {
        NotificationModel notify = NotificationModel.fromJson(result);
        Get.toNamed(Routes.CHECKIN, arguments: notify.id);
      } else if (result['type'] != null && result['type'] == "2") {
        NotificationModel notify = NotificationModel.fromJson(result);
        Get.toNamed(Routes.GRADE, arguments: notify.id);
      } else if (result['type'] != null && result['type'] == "3") {
        NotificationModel notify = NotificationModel.fromJson(result);
        Get.toNamed(Routes.NOTIFICATION_DETAIL, arguments: notify.id);
      }
    }
  }
}

Future<dynamic> onSelectNotification(String? payload) async {
  if (payload != null) {
    Map<String, dynamic>? result = json.decode(payload);
    if (result != null && result['id'] != null) {
      final globalService = Get.find<GlobalService>();
      globalService.notificationData.add(payload);
      //id: id của request
      //idNotification: id của Notification
      //type: 1: detail Need Approval, 2: detail My Request.

      if (result['type'] != null && result['type'] == "1") {
        NotificationModel notify = NotificationModel.fromJson(result);
        Get.toNamed(Routes.CHECKIN, arguments: notify.id);
      } else if (result['type'] != null && result['type'] == "2") {
        NotificationModel notify = NotificationModel.fromJson(result);
        Get.toNamed(Routes.GRADE, arguments: notify.id);
      } else if (result['type'] != null && result['type'] == "3") {
        NotificationModel notify = NotificationModel.fromJson(result);
        Get.toNamed(Routes.NOTIFICATION_DETAIL, arguments: notify.id);
      }
    }
  }
}
