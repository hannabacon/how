import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/screen/home_details/home_details_screen.dart';
import 'package:how/src/store/my_recips_fav_store.dart';
import 'package:how/src/widgets/receitas_loading.dart';

class Body extends StatelessWidget {
  final MyRecipsFavStore store = MyRecipsFavStore();

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
            primary: false,
            shrinkWrap: true,
            itemCount: store.favRecips.length,
            itemBuilder: (context, index) {
              final idRecips = store.favRecips[index]['idRecips'] as String?;
              return ListTile(
                title: Text(store.favRecips[index]['title']),
                subtitle: Text(store.favRecips[index]['description']),
                leading: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(store.favRecips[index]['image']),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        // Add your functionality here
                      },
                      icon: const Icon(Icons.favorite),
                    ),
                    IconButton(
                      onPressed: idRecips != null
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeDetailsScreen(idRecips: idRecips),
                                ),
                              );
                            }
                          : null,
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
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
