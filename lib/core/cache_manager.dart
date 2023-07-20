import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> cacheSave(CacheManagerKey key, dynamic data) async {
    final box = GetStorage();
    await box.write(key.toString(), data);
    return true;
  }

  dynamic cacheGet(CacheManagerKey key) {
    final box = GetStorage();
    return box.read(key.toString());
  }

  Future<void> cacheRemove(CacheManagerKey key) async {
    final box = GetStorage();
    await box.remove(key.toString());
  }
}

enum CacheManagerKey { CUSTOMER_INFO, TOKEN, CONFIG, CLASS_DATA }
