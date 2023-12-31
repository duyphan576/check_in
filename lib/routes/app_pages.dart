import 'package:check_in/modules/home/bindings/home_binding.dart';
import 'package:check_in/modules/home/views/home_view.dart';
import 'package:check_in/modules/login/bindings/login_binding.dart';
import 'package:check_in/modules/login/views/login_view.dart';
import 'package:check_in/modules/profile/bindings/profile_binding.dart';
import 'package:check_in/modules/profile/views/profile_view.dart';
import 'package:check_in/modules/splash/bindings/splash_binding.dart';
import 'package:check_in/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';

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
  ];
}
