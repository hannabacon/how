import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/store/my_recips_fav_store.dart';
import 'package:how/src/widgets/receitas_loading.dart';

class Body extends StatelessWidget {
  final MyRecipsFavStore store = MyRecipsFavStore();

  Body({super.key});

 @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (store.statusPage == StatusPage.loading) {
        return const ReceitasLoading();
      }

      if (store.statusPage == StatusPage.success) {
        return ListView.builder(
          itemCount: store.fav_recips.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(store.fav_recips[index]['title']),
              subtitle: Text(store.fav_recips[index]['subtitle']),
              leading: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(store.fav_recips[index]['image']),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
            );
          },
        );
      }
      return const Center(child: Text('Algo deu errado'));
    });
  }
}