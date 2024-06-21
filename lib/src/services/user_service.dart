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
}
