// ignore_for_file: avoid_dynamic_calls

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lojavirtual/firebase_options.dart';
import 'package:lojavirtual/src/config/theme_colors.dart';
import 'package:lojavirtual/src/pages/auth/controller/auth_controller.dart';
import 'package:lojavirtual/src/pages/auth/sign_in_screen.dart';
import 'package:lojavirtual/src/router/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthController());

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Loja Nicolau',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white.withAlpha(165),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: CustomColors.customSwathColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 1,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}
