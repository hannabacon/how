import 'package:flutter/material.dart';
import 'package:how/src/helper/enums.dart';
import 'package:mobx/mobx.dart';

part 'create_recips_store.g.dart';

class CreateRecipsStore = CreateRecipsBase with _$CreateRecipsStore;

abstract class CreateRecipsBase with Store {
  CreateRecipsBase() {
    ingredientes.add(buildTextField());
  }

    final GlobalKey<NavigatorState> createRecipsKey = GlobalKey<NavigatorState>();

  @observable
  StatusPage statusPage = StatusPage.loading;


  ObservableList<Widget> ingredientes = ObservableList.of([]);

  @action
  void addTextField() {
    ingredientes.add(buildTextField());
  }

  Widget buildTextField() {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Ingredientes',
      ),
    );
  }
}