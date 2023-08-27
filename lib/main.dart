import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app_routes/routes.dart';
import 'app_routes/routes_path.dart';
import 'bindings/home_binding.dart';
import 'utils/app_theme.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      theme: AppTheme.lightTheme(),
      getPages: Routes.routes,
      initialRoute: RoutesPath.homePage,
      home: const HomeView(),
    );
  }
}
