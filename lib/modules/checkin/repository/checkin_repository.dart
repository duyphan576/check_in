import 'package:check_in/modules/checkin/models/checkin_model.dart';
import 'package:check_in/modules/checkin/provider/checkin_provider.dart';

import '../../../core/base_response.dart';

class CheckinRepository {
  CheckinRepository({required this.checkinProvider});

  final CheckinProvider checkinProvider;

  Future<BaseResponse?> checkin(Map<String, dynamic> wifi, url, token) =>
      checkinProvider.checkin(wifi, url, token);
  Future<BaseResponse?> history(url, token) =>
      checkinProvider.history(url, token);
}
