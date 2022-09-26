import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lojavirtual/src/config/theme_colors.dart';
import 'package:lojavirtual/src/pages/auth/controller/auth_controller.dart';
import 'package:lojavirtual/src/pages/common_widgets/custom_text_form_field.dart';
import 'package:lojavirtual/src/services/validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:lojavirtual/src/config/app_data.dart' as app;

class ProfileTab extends StatefulWidget {
  ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
 final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
            onPressed: () {
              authController.signOut();
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
           // Email
          CustomFormTextField(
            readOnly: true,
            initialValue: authController.user.email,
            icon: Icons.email,
            label: 'Email',
          ),

          // Nome
          CustomFormTextField(
            readOnly: true,
            initialValue: authController.user.name,
            icon: Icons.person,
            label: 'Nome',
          ),

          // Celular
          CustomFormTextField(
            readOnly: true,
            initialValue: authController.user.phone,
            icon: Icons.phone,
            label: 'Celular',
          ),

          // CPF
          CustomFormTextField(
            readOnly: true,
            initialValue: authController.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),

          // Botão para atualizar a senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.green,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                updatePassword();
              },
              child: const Text('Atualizar senha'),
            ),
          ),
        ],
      ),
    );
  }

   Future<bool?> updatePassword() {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Titulo
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Atualização de senha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Senha atual
                      CustomFormTextField(
                        controller: currentPasswordController,
                        isSecret: true,
                        icon: Icons.lock,
                        label: 'Senha atual',
                        validator: passwordValidator,
                      ),

                      // Nova senha
                      CustomFormTextField(
                        controller: newPasswordController,
                        isSecret: true,
                        icon: Icons.lock_outline,
                        label: 'Nova senha',
                        validator: passwordValidator,
                      ),

                      // Confirmação nova senha
                      CustomFormTextField(
                        isSecret: true,
                        icon: Icons.lock_outline,
                        label: 'Confirmar nova senha',
                        validator: (password) {
                          final result = passwordValidator(password);

                          if (result != null) {
                            return result;
                          }

                          if (password != newPasswordController.text) {
                            return 'As senhas não são equivalentes';
                          }

                          return null;
                        },
                      ),

                      // Botão de confirmação
                      SizedBox(
                        height: 45,
                        child: Obx(() => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: authController.isLoading.value
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        authController.changePassword(
                                          currentPassword:
                                              currentPasswordController.text,
                                          newPassword:
                                              newPasswordController.text,
                                        );
                                      }
                                    },
                              child: authController.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text('Atualizar'),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
