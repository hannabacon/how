import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how/src/store/create_recips_store.dart';

class Body extends StatelessWidget {
  final CreateRecipsStore store = CreateRecipsStore();

  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  //FALTA ADICIONAR UM CONTROLLER
                ),
              ),
              const SizedBox(height: 20),
              Observer(builder: (_) {
                return Column(
                  children: store.textControllers.asMap().entries.map((entry) {
                    int idx = entry.key;
                    TextEditingController controller = entry.value;
              
                    return Column(
                      children: [
                        TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Ingredientes',
                            suffixIcon: idx == store.textControllers.length - 1
                                ? IconButton(
                                    onPressed: store.addTextField,
                                    icon: const Icon(Icons.add),
                                  )
                                : IconButton(
                                    onPressed: store.removeTextField,
                                    icon: const Icon(Icons.remove),
                                  )
                          ),
                        ),
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
    );
  }
}