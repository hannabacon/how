import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/services/user_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'my_profile_store.g.dart';

class MyProfileStore = MyProfileBase with _$MyProfileStore;

abstract class MyProfileBase with Store {
  final ImagePicker imagePicker = ImagePicker();
  final UserService userService = UserService();

  MyProfileBase() {
    getData("clx6zeodo0000so7zat5aew8a");
  }

  late int userId;

  GlobalKey<State> observerKey = GlobalKey<State>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  Map<String, dynamic> user = {};

  @observable
  StatusPage statusPage = StatusPage.loading;

  @observable
  File? imageFile;

  @observable
  String? imageUrl;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  

  @action
  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await imagePicker.pickImage(source: source);

      if (pickedFile != null) {
        imageUrl = pickedFile.path;
        imageController.text = pickedFile.path;
      } else {
        print('Nenhuma imagem selecionada.');
      }
    } catch (e) {
      print('Erro ao selecionar imagem: $e');
    }
  }

  @action
  void removeImage() {
    imageUrl = null;
    imageController.clear();
  }

  @action
  Future<void> getData(String idUser) async {
    try {
      statusPage = StatusPage.loading;

      Map<String, dynamic>? userResponse = await userService.findUserById(idUser);

      if (userResponse != null) {
        user = userResponse['findUserById'];
        nameController.text = user['name'];
        imageController.text = user['image'];
        passwordController.text = user['password'];
        emailController.text = user['email'];
      }
      
      statusPage = StatusPage.success;
    } catch (e) {
      statusPage = StatusPage.error;
      print('Erro ao buscar dados do usuário: $e');
    }
  }

  @action
  Future<void> updateUser() async {
    try {
      statusPage = StatusPage.loading;

      Map<String, dynamic> data = {
        'idUser': user['idUser'],
        'name': nameController.text,
        'image': imageController.text,
        'email': emailController.text,
        'password': passwordController.text,
      };

      await userService.updateUser(data);

      statusPage = StatusPage.success;
    } catch (e) {
      statusPage = StatusPage.error;
      print('Erro ao atualizar dados do usuário: $e');
    }
  }
}