import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/store/my_profile_store.dart';
import 'package:how/src/widgets/receitas_button.dart';
import 'package:how/src/widgets/receitas_loading.dart';
import 'package:how/src/widgets/receitas_textfield.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatelessWidget {
  final MyProfileStore store = MyProfileStore();

  Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
                'Sinta-se a vontade para se apresentar a nossa comunidade!',
                textAlign: TextAlign.center),
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
                                leading: const Icon(
                                    Icons.restore_from_trash_rounded),
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
                        backgroundImage: store.imageUrl != null
                            ? NetworkImage(store.imageUrl!)
                            : null,
                        child: store.imageUrl == null
                            ? const Icon(Icons.person, size: 60)
                            : null,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ReceitasTextfield(
                    label: 'Nome',
                    controller: store.nameController,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    autoFocus: false,
                    enabled: true,
                  ),
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
                    label: 'Senha',
                    controller: store.passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    autoFocus: false,
                    enabled: true,
                  ),
                ),
                ReceitasButton(
                    label: 'Atualizar',
                    width: 350,
                    onClick: () {
                      store.updateUser();
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
