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
          idRecips
          user {
            name
          }
          title
          image
          makings
          description
          preparation
          type
          createdAt
          updatedAt
          recips {
            type
          }
        }
      }
    ''');

      graphql.QueryResult<Object?> response = await client!.value.query(graphql.QueryOptions(document: query));

      return response.data;
    }

  Future<Map<String, dynamic>?> findRecipsByUserId(data) async {
    client = await Functions.generateGraphQLClient(useCache: false);

    final query = graphql.gql(r'''
      query Query($idUser: String!) {
        findRecipsByUserId(idUser: $idUser) {
          title
          preparation
          image
          makings
          description
          type
          updatedAt
        }
      }
    ''');

    graphql.QueryResult<Object?> response = await client!.value.query(graphql.QueryOptions(document: query, variables: data));

    return response.data;
  }

  Future<Map<String, dynamic>?> findRecipsDetailsByIdRecips(String idRecips) async {
    client = await Functions.generateGraphQLClient(useCache: false);
  
    final query = graphql.gql(r'''
      query Query($idRecips: String!) {
       findRecipsDetailsByIdRecips(idRecips: $idRecips) {
        title
        preparation
        image
        makings
        description
        updatedAt
      }
    }
    ''');
  
    graphql.QueryResult<Object?> response = await client!.value.query(graphql.QueryOptions(document: query, variables: {'idRecips': idRecips}));
  
    return response.data;
  }

}