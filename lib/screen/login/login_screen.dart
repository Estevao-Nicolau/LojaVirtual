import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/models/page_manager.dart';
import 'package:lojavirtual/screen/login/components/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7D79D0),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 40,
                    ),
                    children: [
                      // Nome do App
                      TextSpan(
                        text: 'Loja',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Nicolau',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                    child: AnimatedTextKit(
                      pause: Duration.zero,
                      repeatForever: true,
                      animatedTexts: [
                      FadeAnimatedText('Camisa'),
                      FadeAnimatedText('Sapados'),
                      FadeAnimatedText('Relogio'),
                      FadeAnimatedText('Cinto'),
                      FadeAnimatedText('Pijama'),
                    ]),
                  ),
                )
              ],
            ),
          ),
          // Formulário
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 32,
            ),
            decoration: const BoxDecoration(
              color: const Color.fromARGB(255, 120, 174, 218),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(45),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Email
                const CustomTextField(
                  icon: Icons.email,
                  label: "Email",
                  keyType: TextInputType.emailAddress,
                  // valid: (email) {

                  // }
                ),
                // Senha
                const CustomTextField(
                  icon: Icons.lock,
                  label: "Senha",
                  isSecret: true,
                  keyType: TextInputType.visiblePassword,
                  // valid: (pass) {
                  //    if(pass.isEmpty || pass.length < 6) {
                  //      return 'Senha invalida';
                  //     return null;
                  //    }
                  // },
                ),
                // Botão de Entrar
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Entrar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                // Esqueceu a Senha
                const Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Esqueceu a Senha?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                // Divisor
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    children: const <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('ou'),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                // Botão de Novo User
                SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                    child: Text('Criar Conta'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
