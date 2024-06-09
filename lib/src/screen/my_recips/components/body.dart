import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/store/my_recips_my_store.dart';
import 'package:how/src/widgets/receitas_loading.dart';

class Body extends StatelessWidget {
  final MyRecipsStore store = MyRecipsStore();

  Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        if (store.statusPage == StatusPage.loading) {
          return const ReceitasLoading();
        }

        if (store.statusPage == StatusPage.success) {
          return ListView.builder(
            key: store.globalKey,
            shrinkWrap: true,
            primary: false,
            itemCount: store.myRecips.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(store.myRecips[index]['title']),
                subtitle: Text(store.myRecips[index]['description']),
                leading: Container(
                  width: 90,
                  height: 90,
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(store.myRecips[index]['image']),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/my-recips-edit'),
                  icon: const Icon(Icons.edit),
                ),
              );
            },
          );
        }
        return const Center(child: Text('Algo deu errado'));
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => Navigator.pushNamed(context, '/create-recips'),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}