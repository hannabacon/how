import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/store/home_details_store.dart';
import 'package:how/src/widgets/receitas_loading.dart';

class Body extends StatelessWidget {
  final HomeDetailsStore store = HomeDetailsStore();

  Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        if (store.statusPage == StatusPage.loading) {
          return const ReceitasLoading();
        }

        if (store.statusPage == StatusPage.success) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                child: Expanded(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      Center(
                        child: Image.asset('assets/images/bolo_cenoura.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border, size: 30, color: Colors.white),
                          onPressed: () {
                            // Add your logic here to favorite the recipe
                          },
                        ),
                      ),
                    ],
                  ),
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
                    child: Observer(
                      builder: (_) {
                      return Column(  
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: (store.details_recips[0]['ingredientes'] as Map<String, dynamic>).entries.map((ingredient) {
                            return Text(
                              '${ingredient.key}: ${ingredient.value}',
                              textAlign: TextAlign.left,
                            );
                          }).toList(),
                        );
                      },
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
                    child: Column(  
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: store.details_recips.map((recipe) {
                          return Text(
                            recipe['preparo'],
                            textAlign: TextAlign.left,
                          );
                        }).toList(),
                      ),
                  ),
            ],
          );
        }
        return const Center(
          child: Text('Error'),
        );
      }),
    );
  }
}