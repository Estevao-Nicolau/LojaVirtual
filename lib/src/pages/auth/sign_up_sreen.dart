import 'package:flutter/material.dart';
import 'package:lojavirtual/src/config/theme_colors.dart';
import 'package:lojavirtual/src/pages/auth/components/custom_text_form_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwathColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  // Formulario
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 50,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Email
                        CustomFormTextField(
                          icon: Icons.email,
                          label: "Email",
                          isDense: true,
                          keyType: TextInputType.emailAddress,
                        ),
                        // Senha
                        CustomFormTextField(
                          icon: Icons.lock,
                          label: "Senha",
                          isDense: false,
                          isSecret: true,
                          keyType: TextInputType.visiblePassword,
                        ),
                        // Nome
                        CustomFormTextField(
                          icon: Icons.person,
                          label: "Nome",
                          isDense: true,
                          keyType: TextInputType.name,
                        ),
                        // Celular
                        CustomFormTextField(
                          icon: Icons.phone,
                          label: "Celular",
                          inputFormatters: [phoneFormatter],
                          isDense: true,
                          keyType: TextInputType.phone,
                        ),
                        // CPF
                        CustomFormTextField(
                          icon: Icons.file_copy,
                          label: "CPF",
                          inputFormatters: [cpfFormatter],
                          isDense: true,
                          keyType: TextInputType.number,
                        ),
                        // Botão Cadastrar Usuário
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            onPressed: () {},
                            child: Text(
                              'Cadastrar usuário',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Voltar
              Positioned(
                left: 5,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
