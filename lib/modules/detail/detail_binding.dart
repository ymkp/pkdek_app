import 'package:get/get.dart';
import 'package:poke/modules/detail/detail_controller.dart';
import 'package:poke/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DetailController());
    final int id = int.tryParse(Get.parameters['id'] ?? '') ?? 0;
  }
}
