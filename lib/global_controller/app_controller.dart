import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/data/repository/app_repository.dart';
import 'package:get/get.dart';

class AppController extends GetxController with CacheManager {
  AppController(this.appRepository);

  final AppRepository appRepository;
}
