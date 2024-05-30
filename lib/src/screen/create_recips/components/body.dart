import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:how/src/helper/enums.dart';
// import 'package:how/src/store/create_recips_store.dart';
// import 'package:how/src/widgets/receitas_loading.dart';

class Body extends StatelessWidget {
  // final CreateRecipsStore store = CreateRecipsStore();

  Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: /*Observer(builder: (context) {
        if (store.statusPage == StatusPage.loading) {
          return const ReceitasLoading();
        }

        if (store.statusPage == StatusPage.success) {*/
        Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Campo para adicionar e editar imagens
                  Container(
                    height: 200,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Text('Adicionar/Editar Imagens'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Título',
                      //FALTA ADICIONAR UM CONTROLLER
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Descrição',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Ingredientes',
                      suffixIcon: IconButton(
                        onPressed: () {
                          // Ação do botão
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Doce'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Salgado'),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      const SizedBox(height: 90),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Salvar'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      // }
      // return const Center(child: Text('Algo deu errado'));
    // })
    );
  }
}