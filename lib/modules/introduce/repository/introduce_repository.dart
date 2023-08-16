import 'package:check_in/modules/introduce/models/introduce_model.dart';

import '../../../core/base_response.dart';
import '../provider/introduce_provider.dart';

class IntroduceRepository {
  IntroduceRepository({required this.introduceProvider});

  final IntroduceProvider introduceProvider;

  Future<BaseResponse?> introduce(IntroduceModel introduceModel, url, token) =>
      introduceProvider.introduce(introduceModel, url, token);
}
