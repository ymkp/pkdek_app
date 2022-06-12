import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:poke/routes/app_pages.dart';

/// Service for saving responses
class HiveBoxService extends GetxService {
  /// after initialized, go to home
  /// I think it's not a good implementation
  /// but it's working, so, ehh
  Future<void> init() async {
    await Hive.initFlutter();
    await initHiveResponseMap();
    Get.offAllNamed(Routes.home);
  }

  Future<void> initHiveResponseMap() async {
    await Hive.openBox<String>('box-response');
  }
}
