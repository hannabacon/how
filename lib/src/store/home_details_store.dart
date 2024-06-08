// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:how/src/helper/enums.dart';
import 'package:mobx/mobx.dart';

part 'home_details_store.g.dart';

class HomeDetailsStore = HomeDetailsBase with _$HomeDetailsStore;

abstract class HomeDetailsBase with Store {
  HomeDetailsBase() {
    statusPage = StatusPage.loading;
    getData();
  }

  ObservableList<Map<String, dynamic>> detalhe_da_receita = ObservableList<Map<String, dynamic>>();

  final GlobalKey<NavigatorState> detalhe_da_receitaKey = GlobalKey<NavigatorState>();

  @observable
  StatusPage statusPage = StatusPage.loading;

  @action
  Future<void> getData() async {
    try {
      detalhe_da_receita = ObservableList<Map<String, dynamic>>.of([
        {
          'id': 1,
          'nome': 'Bolo de cenoura',
          'ingredientes': {
            'ovo': '4 unidades',
            'cenoura': '3 cenouras médias raladas',
            'oleo': '1 xícara de óleo',
            'farinha': '2 xícaras de farinha de trigo',
            'fermento': '1 colher de sopa de fermento em pó',
            'cobertura': '1 cenoura ralada e 1 xícara de açúcar'
          },
          'preparo': 'Em um liquidificador, adicione as cenouras, os ovos e o óleo, depois misture. Acrescente o açúcar e bata novamente por 5 minutos. Em uma tigela ou na batedeira, adicione a farinha de trigo e depois misture novamente. Acrescente o fermento e misture lentamente com uma colher. Asse em um forno preaquecido a 180° C por aproximadamente 40 minutos.'
        },

      ]);
      
      statusPage = StatusPage.success;
    } catch (e) {
      statusPage = StatusPage.error;
    }
  }
}