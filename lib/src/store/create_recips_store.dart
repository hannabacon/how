import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
import 'package:how/src/helper/enums.dart';
import 'package:how/src/services/graphql_service.dart';
import 'package:mobx/mobx.dart';

part 'create_recips_store.g.dart';

class CreateRecipsStore = CreateRecipsBase with _$CreateRecipsStore;

abstract class CreateRecipsBase with mobx.Store {
  CreateRecipsBase() {
    textControllers.add(TextEditingController());
    statusPage = StatusPage.idle;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<NavigatorState> observerKey = GlobalKey<NavigatorState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController makingsController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController preparationController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @observable
  StatusPage statusPage = StatusPage.idle;

   @observable
  ObservableList<TextEditingController> textControllers = ObservableList<TextEditingController>();

  @observable
  // List<TextEditingController> textControllers = [];

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

  String getCombinedText() {
    return textControllers.map((controller) => controller.text).join(', ');
  }

  @action
  Future<void> createRecips() async {
    statusPage = StatusPage.loading;
    try {
      // Verificar se os campos não são nulos ou vazios
      if (titleController.text.isEmpty ||
          descriptionController.text.isEmpty ||
          preparationController.text.isEmpty ||
          imageController.text.isEmpty ||
          getCombinedText().isEmpty ||
          typeController.text.isEmpty) {
        throw Exception('Todos os campos devem ser preenchidos');
      }

      final client = await GraphQLService.generateClient(useCache: false);

      final mutation = graphql.gql(r'''
        mutation CreateRecips($data: CreateRecipsInput!) {
          createRecips(data: $data) {
            idRecips
          }
        }
      ''');

      final data = {
        'title': titleController.text,
        'description': descriptionController.text,
        'preparation': preparationController.text,
        'image': imageController.text,
        'makings': getCombinedText(),
        'type': typeController.text,
        'idUser': 'clx6zeodo0000so7zat5aew8a',
      };

      final options = graphql.MutationOptions(
        document: mutation,
        variables: {'data': data},
      );

      final result = await client.mutate(options);

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      statusPage = StatusPage.success;

      ScaffoldMessenger.of(observerKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text('Sua receita foi criada com sucesso!'),
          duration: Duration(seconds: 3),
        ),
      );
    } catch (e) {
      statusPage = StatusPage.error;

      // Mostrar uma mensagem de erro ao usuário
      ScaffoldMessenger.of(observerKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(e is Exception && e.toString() == 'Todos os campos devem ser preenchidos'
              ? e.toString()
              : 'Ocorreu um erro ao criar a receita. Tente novamente.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
