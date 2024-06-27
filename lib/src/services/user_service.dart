import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:how/src/helper/functions.dart';

class UserService {
  late ValueNotifier<graphql.GraphQLClient>? client;

  Future<Map<String, dynamic>?> createUser(Map<String, dynamic> data) async {
    client = await Functions.generateGraphQLClient(useCache: false);

    final mutation = gql(r'''
       mutation Mutation($data: CreateUsersInput!) {
        createUser(data: $data) {
          idUser
          image
          name
          email
          password
        }
      }
    ''');

    graphql.QueryResult<Object?> response = await client!.value.mutate(MutationOptions(document: mutation, variables: {'data': data}));

    return response.data;
  }

  Future<Map<String, dynamic>?> findUserById(String idUser) async {
    client = await Functions.generateGraphQLClient(useCache: false);

    final query = gql(r'''
      query FindUserById($idUser: String!) {
        findUserById(idUser: $idUser) {
          idUser
          image
          name
          email
          password
        }
      }
    ''');

    final options = QueryOptions(
      document: query,
      variables: {'idUser': idUser},
    );

    final result = await client!.value.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return result.data;
  }

  Future<void> updateUser(Map<String, dynamic> data) async {
    client = await Functions.generateGraphQLClient(useCache: false);

    final mutation = gql(r'''
      mutation Mutation($data: UpdateUserInput!) {
        updateUser(data: $data) {
          idUser
        }
      }
    ''');

    await client!.value.mutate(MutationOptions(document: mutation, variables: {'data': data}));
  }
}
