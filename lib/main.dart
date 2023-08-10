import 'dart:convert';

import 'package:check_in/global_binding/app_bindings.dart';
import 'package:check_in/modules/home/controllers/home_controller.dart';
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

final BehaviorSubject<String?> notificationData = BehaviorSubject<String?>();
AndroidNotificationChannel? channel;
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage? message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  // print('Handling a background message ${message.messageId}');
}

_setToken(String token) {
  print("tokentokentokentokentoken");
  print(token);
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
      final storage = GetStorage();
      globalService.notificationData.add(payload);

      //id: id của request
      //idNotification: id của Notification
      //isApproval: 1: detail Need Approval, 2: detail My Request., 4: confirm, 5: bổ sung hồ sơ
      // if (result['isApproval'] != null && result['isApproval'] == "1") {
      //   var summitData = {
      //     "id": result['id'],
      //     "idNotification": result['idNotification'],
      //     "isApproval": result['isApproval']
      //   };
      //   Get.toNamed(Routes.REQUEST_DETAIL, arguments: summitData);
      // } else if (result['isApproval'] != null && result['isApproval'] == "2") {
      //   var summitData = {
      //     "id": result['id'],
      //     "idNotification": result['idNotification'],
      //     "isApproval": result['isApproval']
      //   };
      //   Get.toNamed(Routes.REQUEST_DETAIL, arguments: summitData);
      // } else if (result['isApproval'] != null && result['isApproval'] == "4") {
      //   var summitData = {
      //     "id": result['id'],
      //     "idNotification": result['idNotification'],
      //     "isApproval": result['isApproval']
      //   };
      //   Get.toNamed(Routes.RP_CONFIRMATION_DETAIL, arguments: summitData);
      // } else if (result['isApproval'] != null && result['isApproval'] == "5") {
      //   var summitData = {
      //     "id": result['id'],
      //     "idNotification": result['idNotification'],
      //     "isApproval": result['isApproval']
      //   };
      //   Get.toNamed(Routes.PAY_VOTES_DETAIL, arguments: summitData);
      // } else if (result['isApproval'] != null && result['isApproval'] == "6") {
      //   var summitData = {
      //     "id": result['id'],
      //     "idNotification": result['idNotification'],
      //     "isApproval": result['isApproval']
      //   };
      //   Get.toNamed(Routes.INTERNAL_MONEY_TRANSFER_DETAIL,
      //       arguments: summitData);
      // }
    }
  }
}

Future<dynamic> onSelectNotification(String? payload) async {
  if (payload != null) {
    Map<String, dynamic>? result = json.decode(payload);
    if (result != null && result['id'] != null) {
      final globalService = Get.find<GlobalService>();
      final storage = GetStorage();
      globalService.notificationData.add(payload);
      //id: id của request
      //idNotification: id của Notification
      //isApproval: 1: detail Need Approval, 2: detail My Request.

      // if (result['isApproval'] != null && result['isApproval'] == "1") {
      //   var summitData = {
      //     "id": result['id'],
      //     "idNotification": result['idNotification'],
      //     "isApproval": result['isApproval']
      //   };
      //   Get.toNamed(Routes.REQUEST_DETAIL, arguments: summitData);
      // } else if (result['isApproval'] != null && result['isApproval'] == "2") {
      //   var summitData = {
      //     "id": result['id'],
      //     "idNotification": result['idNotification'],
      //     "isApproval": result['isApproval']
      //   };
      //   Get.toNamed(Routes.REQUEST_DETAIL, arguments: summitData);
      // } else if (result['isApproval'] != null && result['isApproval'] == "4") {
      //   var summitData = {
      //     "id": result['id'],
      //     "idNotification": result['idNotification'],
      //     "isApproval": result['isApproval']
      //   };
      //   Get.toNamed(Routes.RP_CONFIRMATION_DETAIL, arguments: summitData);
      // } else if (result['isApproval'] != null && result['isApproval'] == "5") {
      //   var summitData = {
      //     "id": result['id'],
      //     "idNotification": result['idNotification'],
      //     "isApproval": result['isApproval']
      //   };
      //   Get.toNamed(Routes.PAY_VOTES_DETAIL, arguments: summitData);
      // } else if (result['isApproval'] != null && result['isApproval'] == "6") {
      //   var summitData = {
      //     "id": result['id'],
      //     "idNotification": result['idNotification'],
      //     "isApproval": result['isApproval']
      //   };
      //   Get.toNamed(Routes.INTERNAL_MONEY_TRANSFER_DETAIL,
      //       arguments: summitData);
      // }
    }
  }
}

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
  FirebaseApp app = await Firebase.initializeApp();
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
  var androidInitSettings = AndroidInitializationSettings("app_icon");
  var iosInitSettings = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification);
  var initSettings = InitializationSettings(
      android: androidInitSettings, iOS: iosInitSettings);

  flutterLocalNotificationsPlugin!
      .initialize(initSettings, onSelectNotification: onSelectNotification);

  try {
    var fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      _setToken(fcmToken);
    }
  } catch (e) {
    print(e); // Catches all types of `Exception` and `Error`.
    _setToken("");
  }

  FirebaseMessaging.instance
      .getInitialMessage()
      .then((RemoteMessage? message) async {
    if (message != null && (await Utils.getFcmId(message.messageId!)) == null) {
      Utils.setFcmId(message.messageId!);
      final globalService = Get.find<GlobalService>();
      globalService.navigateNotification.add(json.encode(message.data));
    }
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    Map<String, dynamic> data = message.data;
    AndroidNotification? android = message.notification!.android;
    if (GetPlatform.isIOS) {
      final homeController = Get.find<HomeController>();

      homeController.initListMessage();
    }
    if (notification != null && android != null && !kIsWeb) {
      final globalService = Get.find<GlobalService>();
      globalService.notificationData.add(json.encode(data));
      flutterLocalNotificationsPlugin!.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(channel!.id, channel!.name,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'app_icon',
                importance: Importance.high),
          ),
          payload: json.encode(data));
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
    if (message != null) {
      final globalService = Get.find<GlobalService>();
      globalService.notificationData.add(json.encode(message.data));

      // if (message.data['isApproval'] != null &&
      //     message.data['isApproval'] == "1") {
      //   var summitData = {
      //     "id": message.data['id'],
      //     "idNotification": message.data['idNotification'],
      //     "isApproval": message.data['isApproval']
      //   };
      //   Get.toNamed(Routes.REQUEST_DETAIL, arguments: summitData);
      // } else if (message.data['isApproval'] != null &&
      //     message.data['isApproval'] == "2") {
      //   var summitData = {
      //     "id": message.data['id'],
      //     "idNotification": message.data['idNotification'],
      //     "isApproval": message.data['isApproval']
      //   };
      //   Get.toNamed(Routes.REQUEST_DETAIL, arguments: summitData);
      // } else if (message.data['isApproval'] != null &&
      //     message.data['isApproval'] == "4") {
      //   var summitData = {
      //     "id": message.data['id'],
      //     "idNotification": message.data['idNotification'],
      //     "isApproval": message.data['isApproval']
      //   };
      //   Get.toNamed(Routes.RP_CONFIRMATION_DETAIL, arguments: summitData);
      // } else if (message.data['isApproval'] != null &&
      //     message.data['isApproval'] == "5") {
      //   var summitData = {
      //     "id": message.data['id'],
      //     "idNotification": message.data['idNotification'],
      //     "isApproval": message.data['isApproval']
      //   };
      //   Get.toNamed(Routes.PAY_VOTES_DETAIL, arguments: summitData);
      // } else if (message.data['isApproval'] != null &&
      //     message.data['isApproval'] == "6") {
      //   var summitData = {
      //     "id": message.data['id'],
      //     "idNotification": message.data['idNotification'],
      //     "isApproval": message.data['isApproval']
      //   };
      //   Get.toNamed(Routes.INTERNAL_MONEY_TRANSFER_DETAIL,
      //       arguments: summitData);
      // }
      debugPrint('A new onMessageOpenedApp event was published!');
    }
  });
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
