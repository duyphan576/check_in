import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/statistical/models/statistical_model.dart';
import 'package:check_in/modules/statistical/provider/statistical_provider.dart';

class StatisticalRepository {
  StatisticalRepository({required this.statisticalProvider});

  final StatisticalProvider statisticalProvider;

  Future<BaseResponse?> statistical(
          StatisticalModel statisticalModel, url, token) =>
      statisticalProvider.statistical(statisticalModel, url, token);
}
