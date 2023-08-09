import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/detail/provider/detail_provider.dart';

class DetailRepository {
  DetailRepository({required this.detailProvider});

  final DetailProvider detailProvider;

  Future<BaseResponse?> detail(Map<String, dynamic> classroomId, url, token) =>
      detailProvider.detail(classroomId, url, token);
}
