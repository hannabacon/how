import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
import 'package:how/src/helper/functions.dart';

class RecipsService {
  late ValueNotifier<graphql.GraphQLClient>? client;

  Future<Map<String, dynamic>?> listAllrecips() async {
    client = await Functions.generateGraphQLClient(useCache: false);

    final query = graphql.gql(r'''
      query ListAllrecips {
        listAllrecips {
          user {
            name
          }
          userId
          title
          makings
          description
          type
          createdAt
          updatedAt
          recips {
            type
          }
        }
      }
    ''');

    try {
      graphql.QueryResult<Object?> response =
          await client!.value.query(graphql.QueryOptions(document: query));

      if (response.hasException) {
        print('GraphQL Error: ${response.exception}');
      }

      return response.data;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
