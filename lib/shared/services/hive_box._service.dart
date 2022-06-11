import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

class HiveBoxService extends GetxService {
  Future<void> init() async {
    await Hive.initFlutter();
    await initHiveResponseMap();
  }

  Future<void> initHiveResponseMap() async {
    await Hive.openBox<String>('box-response');
  }
}
