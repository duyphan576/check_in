import 'package:check_in/modules/change_password/bindings/change_password_binding.dart';
import 'package:check_in/modules/change_password/view/change_password_view.dart';
import 'package:check_in/modules/checkin/bindings/checkin_binding.dart';
import 'package:check_in/modules/checkin/views/checkin_view.dart';
import 'package:check_in/modules/classroom/bindings/classroom_binding.dart';
import 'package:check_in/modules/classroom/views/classroom_view.dart';
import 'package:check_in/modules/detail/bindings/detail_binding.dart';
import 'package:check_in/modules/detail/views/detail_view.dart';
import 'package:check_in/modules/forgot_password/bindings/forgot_password_binding.dart';
import 'package:check_in/modules/forgot_password/views/forgot_password_view.dart';
import 'package:check_in/modules/grade/bindings/grade_binding.dart';
import 'package:check_in/modules/grade/views/grade_view.dart';
import 'package:check_in/modules/home/bindings/home_binding.dart';
import 'package:check_in/modules/home/views/home_view.dart';
import 'package:check_in/modules/login/bindings/login_binding.dart';
import 'package:check_in/modules/login/views/login_view.dart';
import 'package:check_in/modules/notification_detail/bindings/notification_detail_binding.dart';
import 'package:check_in/modules/notification_detail/views/notification_detail_view.dart';
import 'package:check_in/modules/pdf_page/bindings/pdf_page_binding.dart';
import 'package:check_in/modules/pdf_page/views/pdf_page_view.dart';
import 'package:check_in/modules/profile/bindings/profile_binding.dart';
import 'package:check_in/modules/profile/views/profile_view.dart';
import 'package:check_in/modules/qr/bindings/qr_binding.dart';
import 'package:check_in/modules/qr/views/qr_view.dart';
import 'package:check_in/modules/splash/bindings/splash_binding.dart';
import 'package:check_in/modules/splash/views/splash_view.dart';
import 'package:check_in/modules/statistical/bindings/statistical_bindings.dart';
import 'package:check_in/modules/statistical/view/statistical_view.dart';
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
    GetPage(
      name: _Paths.CLASSROOM,
      page: () => ClassroomView(),
      binding: ClassroomBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.CHECKIN,
      page: () => CheckinView(),
      binding: CheckinBinding(),
    ),
    GetPage(
      name: _Paths.GRADE,
      page: () => GradeView(),
      binding: GradeBinding(),
    ),
    GetPage(
      name: _Paths.STATISTICAL,
      page: () => StatisticalView(),
      binding: StatisticalBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PDF,
      page: () => PdfPageView(),
      binding: PdfPageBinding(),
    ),
    GetPage(
      name: _Paths.QR,
      page: () => QrView(),
      binding: QrBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_DETAIL,
      page: () => NotificationDetailView(),
      binding: NotificationDetailBinding(),
    ),
  ];
}
