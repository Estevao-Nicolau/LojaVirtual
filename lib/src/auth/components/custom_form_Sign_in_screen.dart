import 'package:flutter/material.dart';
import 'package:lojavirtual/src/auth/components/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class FormSignInScreen extends StatefulWidget {
  @override
  State<FormSignInScreen> createState() => _FormSignInScreenState();
}

class _FormSignInScreenState extends State<FormSignInScreen> {
  // Controller de campos
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Email
              CustomFormTextField(
                icon: Icons.email,
                controller: emailController,
                label: "Email",
                isDense: true,
                keyType: TextInputType.emailAddress,
                validator: (email) {
                  if (email == null || email.isEmpty) return 'Digite seu email';
                },
              ),
              // Senha
              CustomFormTextField(
                icon: Icons.lock,
                key: scaffoldkey,
                controller: passController,
                label: "Senha",
                isDense: true,
                isSecret: true,
                keyType: TextInputType.visiblePassword,
                validator: (password) {
                  if (password == null || password.isEmpty)
                    return 'Digite sua Senha';
                  if (password.length < 5)
                    return 'Digite uma senha com pelo menos 7 caracteres';
                  return null;
                },
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
        ));
  }
}
