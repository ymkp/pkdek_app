import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:poke/routes/app_pages.dart';
import 'package:poke/shared/services/api_service.dart';
import 'package:poke/shared/services/hive_box._service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  /// initialize hive box service
  Get.put(HiveBoxService());

  /// initialize api service,
  /// in this service, when hivebox is ready,
  /// it will navigate to home screen
  Get.put(ApiService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PKDEK',
      debugShowCheckedModeBanner: kDebugMode,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      defaultTransition: Transition.noTransition,
      unknownRoute: AppPages.notFoundRoute,
    );
  }
}
