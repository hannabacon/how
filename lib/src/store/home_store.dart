import 'package:flutter/material.dart';
import 'package:how/src/helper/enums.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeBase with _$HomeStore;

abstract class HomeBase with Store {
  HomeBase() {
    statusPage = StatusPage.loading;
    getData();
  }

  ObservableList<dynamic> receitas = ObservableList<dynamic>();

  final GlobalKey<NavigatorState> receitasKey = GlobalKey<NavigatorState>();

  @observable
  StatusPage statusPage = StatusPage.loading;

  @action
  Future<void> getData() async {
    try {
      receitas.clear();

      receitas.add({
        'title': 'Bolo de cenoura',
        'subtitle': 'Bolo de cenoura com cobertura de chocolate',
        'image': 'assets/images/bolo_cenoura.jpg',
      });

      receitas.add({
        'title': 'Bolo de fubá',
        'subtitle': 'Bolo de fubá com goiabada',
        'image': 'assets/images/bolo_cenoura.jpg',
      });

      receitas.add({
        'title': 'Bolo de laranja',
        'subtitle': 'Bolo de laranja com cobertura de laranja',
        'image': 'assets/images/bolo_cenoura.jpg',
      });

      receitas.add({
        'title': 'Bolo de milho',
        'subtitle': 'Bolo de milho com cobertura de goiabada',
        'image': 'assets/images/bolo_cenoura.jpg',
      });

      receitas.add({
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