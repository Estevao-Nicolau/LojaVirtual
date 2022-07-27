// ignore_for_file: avoid_dynamic_calls

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/firebase_options.dart';
import 'package:lojavirtual/src/auth/sign_in_screen.dart';

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
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
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
