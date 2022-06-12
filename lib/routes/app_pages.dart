import 'package:get/get.dart';
import 'package:poke/modules/detail/detail_binding.dart';
import 'package:poke/modules/detail/screens/detail_screen.dart';
import 'package:poke/modules/home/home_binding.dart';
import 'package:poke/modules/home/screens/home_screen.dart';
import 'package:poke/shared/screens/initial_screen.dart';
import 'package:poke/shared/screens/not_found_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.initial;

  static final notFoundRoute = GetPage(name: '/404', page: () => NotFoundScreen());

  static final routes = [
    GetPage(
      name: Routes.initial,
      page: () => InitialScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '${Routes.detail}/:name',
      page: () => DetailScreen(),
      binding: DetailBinding(),
    ),
  ];
}
