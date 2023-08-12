import 'package:check_in/modules/home/models/home_model.dart';
import 'package:check_in/modules/home/provider/home_provider.dart';

import '../../../core/base_response.dart';

class HomeRepository {
  HomeRepository({required this.homeProvider});

  final HomeProvider homeProvider;

  Future<BaseResponse?> doGet(HomeModel homeModel, url, token) =>
      homeProvider.doGet(homeModel, url, token);
}
