import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lojavirtual/src/config/theme_colors.dart';
import 'package:lojavirtual/src/pages/common_widgets/custom_text_form_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:lojavirtual/src/config/app_data.dart' as app;

class ProfileTab extends StatefulWidget {
  ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          // Email
          CustomFormTextField(
            readOnly: true,
            initialValue: app.user.email,
            icon: Icons.email,
            label: "Email",
            isDense: true,
            keyType: TextInputType.emailAddress,
          ),
          // Nome
          CustomFormTextField(
            readOnly: true,
            initialValue: app.user.name,
            icon: Icons.person,
            label: "Nome",
            isDense: true,
            keyType: TextInputType.name,
          ),
          // Celular
          CustomFormTextField(
            readOnly: true,
            initialValue: app.user.phone,
            icon: Icons.phone_android_sharp,
            label: "Celular",
            isDense: true,
            keyType: TextInputType.number,
            // inputFormatters: [phoneFormatter],
          ),
          // CPF
          CustomFormTextField(
            readOnly: true,
            initialValue: app.user.cpf,
            icon: Icons.file_copy,
            label: "CPF",
            isSecret: true,
            // inputFormatters: [cpfFormatter],
            isDense: true,
            keyType: TextInputType.number,
          ),

          // Botão para atualizar
          SizedBox(
            height: 45,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: CustomColors.customContrastColorLogo),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: updatePassword,
              child: Text('Atualizar senha'),
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Titulo
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Atualização de Senha',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // Senha Atual
                            CustomFormTextField(
                              isSecret: true,
                              icon: Icons.lock,
                              label: 'Senha atual',
                              keyType: null,
                            ),
                            // Senha Nova
                            CustomFormTextField(
                              isSecret: true,
                              icon: Icons.lock_outline,
                              label: 'Nova Senha',
                              keyType: null,
                            ),
                            // Confirmar Senha
                            CustomFormTextField(
                              isSecret: true,
                              icon: Icons.lock_outline,
                              label: 'Confirma nova senha',
                              keyType: null,
                            ),
                            // Botão de Confirmação
                            SizedBox(
                              width: 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                                onPressed: () {},
                                child: Text('Atualizar'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 2,
                        right: 2,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          );
        });
  }
}
