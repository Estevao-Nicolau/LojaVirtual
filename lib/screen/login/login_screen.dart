import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/models/page_manager.dart';
import 'package:lojavirtual/screen/login/components/custom_sign_in_screen.dart';
import 'package:lojavirtual/screen/login/components/custom_text_form_field.dart';
import 'package:lojavirtual/screen/login/components/custom_text_logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7D79D0),
      body: Column(
        children: const <Widget>[
          // Logo
          CustomLogo(),
          // Formulário
          FormSignInScreen(),
        ],
      ),
    );
  }
}
