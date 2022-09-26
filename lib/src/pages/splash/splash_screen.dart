import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lojavirtual/src/config/theme_colors.dart';
import 'package:lojavirtual/src/router/app_pages.dart';

import '../common_widgets/app_name_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(PagesRoutes.signInRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.customContrastColorLogo,
              CustomColors.customSwathColor.shade700,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            AppNameWidget(
              titleColor: Colors.white,
              textSize: 40,
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
