import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:how/src/helper/enums.dart';
import 'package:how/src/services/graphql_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'dart:io';
import 'package:graphql/client.dart' as graphql;

part 'create_user_store.g.dart';

class CreateUserStore = CreateUserBase with _$CreateUserStore;

abstract class CreateUserBase with Store {
  final ImagePicker imagePicker = ImagePicker();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController responsibleName = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @observable
  File? imageFile;

  @observable
  String? imageUrl;

  @observable
  StatusPage statusPage = StatusPage.loading;

  @action
  void setStatusPage(StatusPage value) => statusPage = value;

  @action
  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await imagePicker.pickImage(source: source);

      if (pickedFile != null) {
        imageUrl = pickedFile.path;
        imageController.text = pickedFile.path;
      } else {
        // Usuário cancelou a seleção da imagem
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
  Future<void> createUser(BuildContext context) async {
    statusPage = StatusPage.loading;
    try {
      if (emailController.text.isEmpty ||
          responsibleName.text.isEmpty ||
          passwordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty ||
          imageController.text.isEmpty) {
        throw Exception('Preencha todos os campos!');
      }

      final client = await GraphQLService.generateClient(useCache: false);

      final mutation = graphql.gql(r'''
        mutation Mutation($data: CreateUsersInput!) {
          createUser(data: $data) {
            image
            name
            email
            password
          }
        }
        ''');

      final data = {
        'name': responsibleName.text,
        'email': emailController.text,
        'password': passwordController.text,
        'image': imageController.text,
      };

      graphql.QueryResult<Object?> response = await client.mutate(
        graphql.MutationOptions(document: mutation, variables: {'data': data}),
      );

      if (response.hasException) {
        throw Exception('Erro ao criar usuário');
      }

      statusPage = StatusPage.success;

      if (statusPage == StatusPage.success) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuário criado com sucesso!')));
      }
    } catch (e) {
      print('Erro ao criar usuário: $e');
      statusPage = StatusPage.error;
    }
  }
}
