import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/store/create_recips_store.dart';
import 'package:how/src/widgets/receitas_button.dart';
import 'package:how/src/widgets/receitas_button_white.dart';
import 'package:how/src/widgets/receitas_textfield.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatelessWidget {
  final CreateRecipsStore store = CreateRecipsStore();

  Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: store.scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            children: [
              Observer(
                builder: (_) {
                  return GestureDetector(
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
                              ? const Icon(Icons.fastfood_sharp, size: 60)
                              : null,
                        );
                      },
                    ),
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              ReceitasTextfield(
                  label: "Titulo",
                  controller: store.titleController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  autoFocus: false,
                  enabled: true),
              const SizedBox(height: 10),
              ReceitasTextfield(
                  label: "Descrição",
                  controller: store.descriptionController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  autoFocus: false,
                  enabled: true),
              const SizedBox(height: 10),
              ReceitasTextfield(
                  label: "Modo de Preparo",
                  controller: store.preparationController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  autoFocus: false,
                  enabled: true),
              const SizedBox(height: 10),
              Observer(builder: (_) {
                return Column(
                  children: store.textControllers.asMap().entries.map((entry) {
                    int idx = entry.key;
                    return Column(
                      children: [
                        ReceitasTextfield(
                            label: "Ingrediente ${idx + 1}",
                            controller: store.textControllers[idx],
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            autoFocus: false,
                            enabled: true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                if (idx == store.textControllers.length - 1) {
                                  store.addTextField();
                                } else {
                                  store.removeTextField();
                                }
                              },
                              icon: Icon(
                                idx == store.textControllers.length - 1
                                    ? Icons.add
                                    : Icons.remove,
                              ),
                            )),
                        const SizedBox(height: 10),
                      ],
                    );
                  }).toList(),
                );
              }),
              const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReceitasWhiteButton(
                          label: "Favoritar",
                          width: 130,
                          onClick: () {
                            store.typeController.text = '2';
                          }),
                      const SizedBox(width: 10),
                      ReceitasWhiteButton(
                          label: "Não Favoritar",
                          width: 130,
                          onClick: () {
                            store.typeController.text = '1';
                          }),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 90),
              Observer(
                builder: (_) {
                  return ReceitasButton(
                    label: "Criar",
                    onClick: () async {
                      await store.createRecips();
                      if (store.statusPage == StatusPage.success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Sua receita foi criada com sucesso!'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        Navigator.of(context).pushNamed('/my-recips');
                      }
                    },
                    width: 300,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
