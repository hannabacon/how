import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/store/my_recips_store.dart';
import 'package:how/src/widgets/receitas_loading.dart';

class Body extends StatelessWidget {
  final MyRecipsStore store = MyRecipsStore();

  Body({super.key});

 @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (store.statusPage == StatusPage.loading) {
        return const ReceitasLoading();
      }

      if (store.statusPage == StatusPage.success) {
        return ListView.builder(
          itemCount: store.receitas_fav.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(store.receitas_fav[index]['title']),
              subtitle: Text(store.receitas_fav[index]['subtitle']),
              leading: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(store.receitas_fav[index]['image']),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            );
          },
        );
      }
      return const Center(child: Text('Algo deu errado'));
    });
  }
}