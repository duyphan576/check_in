import 'package:check_in/modules/classroom/bindings/classroom_binding.dart';
import 'package:check_in/modules/classroom/views/classroom_view.dart';
import 'package:check_in/modules/gradelist/bindings/gradelist_binding.dart';
import 'package:check_in/modules/gradelist/views/gradelist_view.dart';
import 'package:check_in/modules/home/bindings/home_binding.dart';
import 'package:check_in/modules/home/views/home_view.dart';
import 'package:check_in/modules/login/bindings/login_binding.dart';
import 'package:check_in/modules/login/views/login_view.dart';
import 'package:check_in/modules/profile/bindings/profile_binding.dart';
import 'package:check_in/modules/profile/views/profile_view.dart';
import 'package:check_in/modules/splash/bindings/splash_binding.dart';
import 'package:check_in/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';

import '../modules/document/bindings/document_binding.dart';
import '../modules/document/view/document_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CLASSROOM,
      page: () => ClassroomView(),
      binding: ClassroomBinding(),
    ),
    GetPage(
      name: _Paths.GRADELIST,
      page: () => GradelistView(),
      binding: GradelistBinding(),
    ),
    GetPage(
      name: _Paths.DOCUMENT,
      page: () => DocumentView(),
      binding: DocumentBinding(),
    ),
  ];
}
