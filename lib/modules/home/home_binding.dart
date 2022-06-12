import 'package:get/get.dart';
import 'package:poke/modules/home/home_controller.dart';

/// Binding for home screen
/// Put HomeController
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
