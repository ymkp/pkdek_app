import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:poke/const/theme.dart';
import 'package:poke/routes/app_pages.dart';
import 'package:poke/shared/services/api_service.dart';
import 'package:poke/shared/services/hive_box._service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Get.put(HiveBoxService());
  Get.put(ApiService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PKDEK',
      theme: ThemeData(
        textTheme: TextTheme(
          headline6: kTextBold600.copyWith(fontSize: 18),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        // canvasColor: Colors.transparent
      ),
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      defaultTransition: Transition.noTransition,
      unknownRoute: AppPages.notFoundRoute,
    );
  }
}
