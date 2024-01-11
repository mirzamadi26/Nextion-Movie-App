import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


import 'interface/utils/themes/app_theme.dart';
import 'interface/views/splash_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(GetMaterialApp(
    theme: AppTheme.apptheme(),
    home: SplashView(),
    themeMode: ThemeMode.light,
    debugShowCheckedModeBanner: false,
  ));
}
