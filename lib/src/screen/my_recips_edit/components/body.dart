import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/screen/my_recips/my_recips_screen.dart';
import 'package:how/src/store/my_recips_edit_store.dart';
import 'package:how/src/widgets/receitas_button.dart';
import 'package:how/src/widgets/receitas_textfield.dart';

class Body extends StatelessWidget {
  final MyRecipsEditStore store = MyRecipsEditStore();
  Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(
            builder: (_) => Column(
              children: [
                // Campo para adicionar e editar imagens
                Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: const Center(
                    child: Text('Adicionar/Editar Imagens'),
                  ),
                ),
                const SizedBox(height: 10),
                ReceitasTextfield(
                  label: "Título",
                  controller: store.titleController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  autoFocus: false,
                  enabled: true,
                ),
                const SizedBox(height: 10),
                ReceitasTextfield(
                  label: "Descrição",
                  controller: store.descriptionController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  autoFocus: false,
                  enabled: true,
                ),
                const SizedBox(height: 10),
                Column(
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
                ),
                ReceitasTextfield(
                  label: "Modo de Preparo",
                  controller: store.preparationController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  autoFocus: false,
                  enabled: true,
                ),
                const SizedBox(height: 30),
                ReceitasButton(
                  label: "Salvar",
                  width: 450,
                  onClick: () async {
                    await store.updateRecipsFromControllers();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const MyRecipsScreen()),
                    );
                  },
                ),
                Observer(
                  builder: (context) {
                    if (store.statusPage == StatusPage.success) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Receita atualizada com sucesso!')),
                        );
                      });
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}