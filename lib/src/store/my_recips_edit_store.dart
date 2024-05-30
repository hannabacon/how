import 'package:flutter/material.dart';
import 'package:how/src/helper/enums.dart';
import 'package:mobx/mobx.dart';

part 'my_recips_edit_store.g.dart';

class MyRecipsEditStore = MyRecipsEditBase with _$MyRecipsEditStore;

abstract class MyRecipsEditBase with Store {
  MyRecipsEditBase() {
    ingredientes.add(buildTextField());
  }

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
