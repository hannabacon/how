// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/services/recips_service.dart';
import 'package:mobx/mobx.dart';

part 'home_details_store.g.dart';

class HomeDetailsStore = HomeDetailsBase with _$HomeDetailsStore;

abstract class HomeDetailsBase with Store {
  HomeDetailsBase() {
    statusPage = StatusPage.loading;
    getData();
  }

  ObservableList<Map<String, dynamic>> details_recips = ObservableList<Map<String, dynamic>>();

  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @observable
  StatusPage statusPage = StatusPage.loading;

  @action
  Future<void> getData() async {
    try {
      statusPage = StatusPage.loading;

      Map<String, dynamic>? details_recips = await RecipsService().listAllrecips();

      if (details_recips?['listAllrecips'] != null) {
        details_recips?.addAll(details_recips['listAllrecips']);
      }

      statusPage = StatusPage.success;
    } catch (e) {
      statusPage = StatusPage.error;
    }
  }
}