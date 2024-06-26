// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/services/recips_service.dart';
import 'package:mobx/mobx.dart';

part 'home_details_store.g.dart';

class HomeDetailsStore = HomeDetailsBase with _$HomeDetailsStore;

abstract class HomeDetailsBase with Store {
  HomeDetailsBase(String idRecips) {
  statusPage = StatusPage.loading;
  getData(idRecips);
}

  ObservableList<Map<String, dynamic>> recipeDetails = ObservableList<Map<String, dynamic>>();
  TextEditingController typeController = TextEditingController();

  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @observable
  StatusPage statusPage = StatusPage.loading;

  @action
  Future<void> getData(String idRecips) async {
    try {
      statusPage = StatusPage.loading;

      Map<String, dynamic>? recipeDetailsResponse = await RecipsService().findRecipsDetailsByIdRecips(idRecips);

      if (recipeDetailsResponse?['findRecipsDetailsByIdRecips'] != null) {
        recipeDetails.clear();
        recipeDetails.add(recipeDetailsResponse!['findRecipsDetailsByIdRecips']);
      }

      statusPage = StatusPage.success;
    } catch (e) {
      statusPage = StatusPage.error;
    }
  }

  @action
  Future<void> updateRecipsFromControllers() async {
    Map<String, dynamic> data = {
      if (typeController.text.isNotEmpty) 'type': typeController.text,
      'idRecips': 'clxktkmux00071yxwfbwkd1ke',
    };
  
    try {
      await RecipsService().updateRecips(data);
      statusPage = StatusPage.success;
    } catch (e) {
      statusPage = StatusPage.error;
      print("Error updating recips: $e");
    }
  }

}
