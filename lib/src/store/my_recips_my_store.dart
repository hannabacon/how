import 'package:flutter/material.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/services/recips_service.dart';
import 'package:mobx/mobx.dart';

part 'my_recips_my_store.g.dart';

class MyRecipsStore = MyRecipsBase with _$MyRecipsStore;

abstract class MyRecipsBase with Store {
  MyRecipsBase() {
    statusPage = StatusPage.loading;
    getData({'idUser': 'clx70v0p2000011wh4lv00b87'});
  }

  ObservableList<dynamic> myRecips = ObservableList<dynamic>();

  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @observable
  StatusPage statusPage = StatusPage.loading;

  @action
  Future<void> getData(Map<String, String> data) async {
    try {
      statusPage = StatusPage.loading;
  
      Map<String, dynamic>? userRecips = await RecipsService().findRecipsByUserId(data);
  
      if (userRecips?['findRecipsByUserId'] != null) {
        myRecips.addAll(userRecips!['findRecipsByUserId']);
      }
  
      statusPage = StatusPage.success;
    } catch (e) {
      statusPage = StatusPage.error;
    }
  }
}