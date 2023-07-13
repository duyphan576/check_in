import 'package:check_in/modules/splash/provider/splash_provider.dart';

import '../../../core/base_response.dart';
import '../models/splash_model.dart';

class SplashRepository {
  SplashRepository({required this.splashProvider});

  final SplashProvider splashProvider;

  Future<BaseResponse?> getConfig(SplashModel splashModel) =>
      splashProvider.getConfig(splashModel);

  Future<BaseResponse?> getLang(SplashModel splashModel) =>
      splashProvider.getLang(splashModel);

  Future<BaseResponse?> getInforUser(SplashModel splashModel) =>
      splashProvider.getInfoUser(splashModel);
}
