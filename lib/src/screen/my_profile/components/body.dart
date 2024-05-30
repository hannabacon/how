import 'package:flutter/material.dart';
import 'package:how/src/store/my_profile_store.dart';

class Body extends StatelessWidget {
  final MyProfileStore store = MyProfileStore();

  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text('Sinta-se a vontade para se apresentar a nossa comunidade!', textAlign: TextAlign.center),
          ),
          Form(
            key: store.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: CircleAvatar(
                    radius: 100,
                    child: Center(
                      child: Text('Adicionar Imagem'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    enabled: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Como você quer ser chamado?',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    enabled: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Conte-nos um pouco sobre você',
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shadowColor: Colors.black,
              minimumSize: const Size(200, 50),
            ),
            child: const Text('Salvar', style: TextStyle(color: Colors.white
            ),
          )
          ),
        ],
      ),
    );
  }
}