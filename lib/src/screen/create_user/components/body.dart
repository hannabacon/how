import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/screen/login/login_screen.dart';
import 'package:how/src/store/create_user_store.dart';
import 'package:how/src/widgets/receitas_button.dart';
import 'package:how/src/widgets/receitas_textfield.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatelessWidget {
  final CreateUserStore store = CreateUserStore();

  Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'Para se cadastrar, preencha os campos abaixo.',
              textAlign: TextAlign.center,
            ),
          ),
          Form(
            key: store.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext bc) {
                        return SafeArea(
                          child: Wrap(
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.photo_library),
                                title: const Text('Galeria'),
                                onTap: () {
                                  store.pickImage(ImageSource.gallery);
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.photo_camera),
                                title: const Text('Câmera'),
                                onTap: () {
                                  store.pickImage(ImageSource.camera);
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.restore_from_trash_rounded),
                                title: const Text('Remover imagem'),
                                onTap: () {
                                  store.removeImage();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Observer(
                    builder: (_) {
                      return CircleAvatar(
                        radius: 60,
                        backgroundImage: store.imageUrl != null ? NetworkImage(store.imageUrl!) : null,
                        child: store.imageUrl == null
                            ? const Icon(Icons.person, size: 60)
                            : null,
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ReceitasTextfield(
                    label: 'Email',
                    controller: store.emailController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    autoFocus: false,
                    enabled: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ReceitasTextfield(
                    label: 'Nome completo',
                    controller: store.responsibleName,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    autoFocus: false,
                    enabled: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ReceitasTextfield(
                    label: 'Senha',
                    controller: store.passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    autoFocus: false,
                    enabled: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ReceitasTextfield(
                    label: 'Confirmar senha',
                    controller: store.confirmPasswordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    autoFocus: false,
                    enabled: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ReceitasButton(
                    label: 'Registrar',
                    width: MediaQuery.of(context).size.width,
                    onClick: () async {
                      await store.createUser(context);
                      if (store.statusPage == StatusPage.success) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      }
                    },
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
