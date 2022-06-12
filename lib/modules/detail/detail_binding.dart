import 'package:get/get.dart';
import 'package:poke/modules/detail/detail_controller.dart';
import 'package:poke/modules/home/home_controller.dart';

/// Binding used in Detail Screen.
/// get parameter on name.
/// I still dont know how to navigate if there is no parameter
class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    final String name = Get.parameters['name'] ?? '';
    Get.lazyPut(() => DetailController(name));
    // Get.find<DetailController>().getPokemonDetail(name);
  }
}
