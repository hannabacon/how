// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:how/src/helper/enums.dart';
import 'package:mobx/mobx.dart';

part 'my_recips_my_store.g.dart';

class MyRecipsStore = MyRecipsBase with _$MyRecipsStore;

abstract class MyRecipsBase with Store {
  MyRecipsBase() {
    statusPage = StatusPage.loading;
    getData();
  }

  ObservableList<dynamic> my_recips = ObservableList<dynamic>();

  final GlobalKey<NavigatorState> my_recipsKey = GlobalKey<NavigatorState>();

  @observable
  StatusPage statusPage = StatusPage.loading;

  @action
  Future<void> getData() async {
    try {
      my_recips.clear();

      my_recips.add({
        'title': 'Bolo de cenoura',
        'subtitle': 'Bolo de cenoura com cobertura de chocolate',
        'image': 'assets/images/bolo_cenoura.jpg',
      });

      my_recips.add({
        'title': 'Bolo de fubá',
        'subtitle': 'Bolo de fubá com goiabada',
        'image': 'assets/images/bolo_cenoura.jpg',
      });

      my_recips.add({
        'title': 'Bolo de laranja',
        'subtitle': 'Bolo de laranja com cobertura de laranja',
        'image': 'assets/images/bolo_cenoura.jpg',
      });

      my_recips.add({
        'title': 'Bolo de milho',
        'subtitle': 'Bolo de milho com cobertura de goiabada',
        'image': 'assets/images/bolo_cenoura.jpg',
      });

      my_recips.add({
        'title': 'Bolo de chocolate',
        'subtitle': 'Bolo de chocolate com cobertura de chocolate',
        'image': 'assets/images/bolo_cenoura.jpg',
      });
      
  statusPage = StatusPage.success;
    } catch (e) {
      statusPage = StatusPage.error;
    }
  }
}