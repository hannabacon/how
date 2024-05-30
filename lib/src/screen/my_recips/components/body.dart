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
            itemCount: store.my_recips.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(store.my_recips[index]['title']),
                subtitle: Text(store.my_recips[index]['subtitle']),
                leading: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(store.my_recips[index]['image']),
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