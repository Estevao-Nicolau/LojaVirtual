import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/auth/components/custom_form_Sign_in_screen.dart';
import 'package:lojavirtual/auth/components/custom_text_logo.dart';
import 'package:lojavirtual/models/page_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF7D79D0),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children:  <Widget>[
              // Logo
               const CustomLogo(),
              // Formulário
              FormSignInScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
