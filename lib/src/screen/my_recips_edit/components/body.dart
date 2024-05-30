import 'package:flutter/material.dart';
import 'package:how/src/store/my_recips_edit_store.dart';

class Body extends StatelessWidget {
  final MyRecipsEditStore store = MyRecipsEditStore();

  Body({super.key});

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
    );
  }
}
