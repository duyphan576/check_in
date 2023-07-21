import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/detail/models/detail_model.dart';
import 'package:check_in/modules/detail/provider/detail_provider.dart';

class DetailRepository {
  DetailRepository({required this.detailProvider});

  final DetailProvider detailProvider;

  Future<BaseResponse?> detail(DetailModel detailModel, url, token) =>
      detailProvider.detail(detailModel, url, token);
}
