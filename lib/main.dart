import 'package:check_in/global_binding/app_bindings.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/global_service.dart';
import 'package:check_in/utils/dismiss_keyboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'settings/firebase_options.dart';

Future<void> main() async {
  if (kReleaseMode) {
    await dotenv.load(fileName: '.env.prod');
  } else {
    await dotenv.load(fileName: '.env.dev');
  }
  //Khai báo các thuộc tính bắt buộc khi ứng dụng có sử dụng Firebase
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String initialRoute = AppPages.INITIAL;
  await GetStorage.init();
  await Get.putAsync(() => GlobalService().init());
  print('Initialized default app $app');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

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

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Sizer(builder: (context, orientation, device) {
//       return GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Student Checkin App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const MyHomePage(title: 'Login Page'),
//       );
//     });
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return SplashView();
//   }
// }
