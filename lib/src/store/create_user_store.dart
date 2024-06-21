import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:how/src/helper/enums.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
import 'package:mobx/mobx.dart';

import '../services/graphql_service.dart';

part 'create_user_store.g.dart';

class CreateUserStore = CreateUserBase with _$CreateUserStore;

abstract class CreateUserBase with Store {
  CreateUserBase() {
    // getData();
  }

  GlobalKey<State> observerKey = GlobalKey<State>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController responsibleName = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @observable
  StatusPage statusPage = StatusPage.loading;

  @action
  void setStatusPage(StatusPage value) => statusPage = value;

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
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuário criado com sucesso!')));
      }
    } catch (e) {
      statusPage = StatusPage.error;
    }
  }
}
