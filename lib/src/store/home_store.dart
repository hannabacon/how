import 'package:flutter/material.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/services/recips_service.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeBase with _$HomeStore;

abstract class HomeBase with Store {
  HomeBase() {
    statusPage = StatusPage.loading;
    getData();
  }

  ObservableList<dynamic> recips = ObservableList<dynamic>();

  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @observable
  StatusPage statusPage = StatusPage.loading;

  @action
  Future<void> getData() async {
    try {
      statusPage = StatusPage.loading;

      Map<String, dynamic>? allRecips = await RecipsService().listAllrecips();

      if (allRecips?['listAllrecips'] != null) {
        recips.addAll(allRecips!['listAllrecips']);
      }

      statusPage = StatusPage.success;
    } catch (e) {
      statusPage = StatusPage.error;
    }
  }
}
