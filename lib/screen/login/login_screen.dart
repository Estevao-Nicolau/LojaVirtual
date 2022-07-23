import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/screen/login/components/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: const Color(0xFF7D79D0),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 35,
                ),
                decoration: const BoxDecoration(
                  color: const Color.fromARGB(255, 120, 174, 218),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: ListView(
                  children: const <Widget>[
                    CustomTextField(
                      icon: Icons.email,
                      label: "Email",
                      keyType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      icon: Icons.lock,
                      label: "Senha",
                      isSecret: true,
                      keyType: TextInputType.visiblePassword,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
