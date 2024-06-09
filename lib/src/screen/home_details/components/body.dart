import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/store/home_details_store.dart';
import 'package:how/src/widgets/receitas_loading.dart';

class Body extends StatelessWidget {
  final String idRecips;
  final HomeDetailsStore store;

  Body({required this.idRecips, super.key})
      : store = HomeDetailsStore(idRecips);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        if (store.statusPage == StatusPage.loading) {
          return const ReceitasLoading();
        }

        if (store.statusPage == StatusPage.success) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Center(
                      child: Image.network(
                        store.recipeDetails.first['image'],
                        fit: BoxFit.cover,
                        height: 300,
                        width: 300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border, size: 30, color: Colors.red),
                        onPressed: () {
                          // Adicione sua lógica para favoritar a receita aqui
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: const Text(
                  'Ingredientes:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  (store.recipeDetails.first['makings'] as String).split(',').join('\n'),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: const Text(
                  'Modo de Preparo:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  (store.recipeDetails.first['preparation']),
                ),
              ),
            ],
          );
        }

        if (store.statusPage == StatusPage.error) {
          return const Center(
            child: Text('Erro ao carregar os detalhes da receita'),
          );
        }

        return Container();
      }),
    );
  }
}
