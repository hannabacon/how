import 'package:flutter/material.dart';
import 'package:how/src/helper/enums.dart';
import 'package:mobx/mobx.dart';

part 'create_recips_store.g.dart';

class CreateRecipsStore = CreateRecipsBase with _$CreateRecipsStore;

abstract class CreateRecipsBase with Store {
  CreateRecipsBase() {
    textControllers.add(TextEditingController());
  }

  final GlobalKey<NavigatorState> createRecipsKey = GlobalKey<NavigatorState>();

  @observable
  StatusPage statusPage = StatusPage.loading;

  @observable
  ObservableList<TextEditingController> textControllers =
      ObservableList<TextEditingController>();

  @action
  void addTextField() {
    textControllers.add(TextEditingController());
  }

  @action
  void removeTextField() {
    if (textControllers.isNotEmpty) {
      textControllers.removeLast();
    }
  }
}
