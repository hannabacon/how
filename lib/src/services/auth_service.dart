import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
import 'package:how/src/helper/functions.dart';

class AuthService {
  late ValueNotifier<graphql.GraphQLClient>? client;

  Future<Map<String, dynamic>?> login(String email, String password) async {
    client = await Functions.generateGraphQLClient(useCache: false);

    final query = graphql.gql(r'''
      query Query($password: String!, $email: String!) {
        login(password: $password, email: $email)
      }
    ''');

    graphql.QueryResult<Object?> response = await client!.value.query(graphql.QueryOptions(document: query, variables: {'email': email, 'password': password}));

    return response.data;
  }
}