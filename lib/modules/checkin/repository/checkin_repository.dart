import 'package:check_in/modules/checkin/models/checkin_model.dart';
import 'package:check_in/modules/checkin/provider/checkin_provider.dart';

import '../../../core/base_response.dart';

class CheckinRepository {
  CheckinRepository({required this.checkinProvider});

  final CheckinProvider checkinProvider;

  Future<BaseResponse?> checkin(CheckinModel checkinModel, url, token) =>
      checkinProvider.checkin(checkinModel, url, token);
}
