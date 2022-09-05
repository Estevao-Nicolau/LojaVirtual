// ignore_for_file: avoid_dynamic_calls

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/firebase_options.dart';
import 'package:lojavirtual/src/config/theme_colors.dart';
import 'package:lojavirtual/src/pages/auth/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

// visualDensity: VisualDensity.adaptivePlatformDensity,
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: LoginScreen(),
    );
  }
}
