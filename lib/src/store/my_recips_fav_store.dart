import 'package:flutter/material.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/services/recips_service.dart';
import 'package:mobx/mobx.dart';

part 'my_recips_fav_store.g.dart';

class MyRecipsFavStore = MyRecipsFavBase with _$MyRecipsFavStore;

abstract class MyRecipsFavBase with Store {
  MyRecipsFavBase() {
    statusPage = StatusPage.loading;
    getData();
  }

  ObservableList<dynamic> favRecips = ObservableList<dynamic>();

  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @observable
  StatusPage statusPage = StatusPage.loading;

  @action
  Future<void> getData() async {
    try {
      statusPage = StatusPage.loading;

      Map<String, dynamic>? allRecips = await RecipsService().listAllrecips();

      if (allRecips?['listAllrecips'] != null) {
        // Filtra os itens com tipo 2
        final filteredRecips = allRecips!['listAllrecips'].where((recip) {
          final type = recip['type'] as String?;
          return type == '2';
        }).toList();    
         
        favRecips.addAll(filteredRecips);
      }

      statusPage = StatusPage.success;
    } catch (e) {
      statusPage = StatusPage.error;
    }
  }
}
