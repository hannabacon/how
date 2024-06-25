import 'package:flutter/material.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/services/recips_service.dart';
import 'package:mobx/mobx.dart';

part 'my_recips_edit_store.g.dart';

class MyRecipsEditStore = MyRecipsEditBase with _$MyRecipsEditStore;

abstract class MyRecipsEditBase with Store {
  MyRecipsEditBase() {
    textControllers.add(TextEditingController());
  }

  @observable
  StatusPage statusPage = StatusPage.loading;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController preparationController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController makingsController = TextEditingController();

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

  void setIdRecips(String idRecips) async {
    Map<String, dynamic> data = {'idRecips': idRecips};
    Map<String, dynamic>? recips = await RecipsService().findRecipsByUserId(data);

    titleController.text = recips?['title'];
    descriptionController.text = recips?['description'];
    preparationController.text = recips?['preparation'];
    typeController.text = recips?['type'];
    imageController.text = recips?['image'];
    makingsController.text = recips?['makings'];
  }
  
  @action
  Future<void> updateRecipsFromControllers() async {
    Map<String, dynamic> data = {
      if (titleController.text.isNotEmpty) 'title': titleController.text,
      if (descriptionController.text.isNotEmpty) 'description': descriptionController.text,
      if (preparationController.text.isNotEmpty) 'preparation': preparationController.text,
      if (typeController.text.isNotEmpty) 'type': typeController.text,
      if (imageController.text.isNotEmpty) 'image': imageController.text,
      if (makingsController.text.isNotEmpty) 'makings': makingsController.text,
      'idRecips': 'clx70t07w000212o22hjshdua',
    };
  
    try {
      await RecipsService().updateRecips(data);
      statusPage = StatusPage.success;
    } catch (e) {
      statusPage = StatusPage.error;
      print("Error updating recips: $e");
    }
  }

  @action
  Future<void> deleteRecips() async {
    try {
      await RecipsService().deleteRecips('clxkvirbx000p1yxwx4c4d7qc');
      statusPage = StatusPage.success;
    } catch (e) {
      statusPage = StatusPage.error;
      print("Error deleting recips: $e");
    }
  }

}
