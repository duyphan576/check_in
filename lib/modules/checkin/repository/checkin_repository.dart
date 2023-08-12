import 'package:check_in/modules/checkin/provider/checkin_provider.dart';

import '../../../core/base_response.dart';

class CheckinRepository {
  CheckinRepository({required this.checkinProvider});

  final CheckinProvider checkinProvider;

  Future<BaseResponse?> doPost(Map<String, dynamic> data, url, token) =>
      checkinProvider.doPost(data, url, token);
  Future<BaseResponse?> history(url, token) =>
      checkinProvider.history(url, token);
}
