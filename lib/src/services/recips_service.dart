import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart';
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
          recips {
            type
          }
        }
      }
    ''');

    graphql.QueryResult<Object?> response =
        await client!.value.query(graphql.QueryOptions(document: query));

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
        }
      }
    ''');

    graphql.QueryResult<Object?> response = await client!.value
        .query(graphql.QueryOptions(document: query, variables: data));

    return response.data;
  }

  Future<Map<String, dynamic>?> findRecipsDetailsByIdRecips(
      String idRecips) async {
    client = await Functions.generateGraphQLClient(useCache: false);

    final query = graphql.gql(r'''
      query Query($idRecips: String!) {
       findRecipsDetailsByIdRecips(idRecips: $idRecips) {
        title
        preparation
        image
        makings
        description
      }
    }
    ''');

    graphql.QueryResult<Object?> response = await client!.value.query(
        graphql.QueryOptions(
            document: query, variables: {'idRecips': idRecips}));

    return response.data;
  }

  Future<void> createRecips(Map<String, dynamic> data) async {
    client = await Functions.generateGraphQLClient(useCache: false);

    final mutation = gql(r'''
        mutation CreateRecips($data: RecipsInput!) {
          createRecips(data: $data) {
            idRecips
          }
        }
      ''');

    final options = MutationOptions(
      document: mutation,
      variables: {'data': data},
    );

    final result = await client!.value.mutate(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
  }

  Future<void> updateRecips(Map<String, dynamic> data) async {
    client = await Functions.generateGraphQLClient(useCache: false);

    final mutation = gql(r'''
        mutation UpdateRecips($data: UpdateRecipsInput!) {
          updateRecips(data: $data) {
            idRecips
            title
            preparation
            image
            makings
            description
            type
          }
        }
      ''');

    final options = MutationOptions(
      document: mutation,
      variables: {'data': data},
    );

    final result = await client!.value.mutate(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
  }

  Future<void> deleteRecips(String idRecips) async {
    client = await Functions.generateGraphQLClient(useCache: false);

    final mutation = gql(r'''
       mutation Mutation($idRecips: String!) {
        deleteRecips(idRecips: $idRecips) {
          idRecips
        }
      }
    ''');

    final options = MutationOptions(
      document: mutation,
      variables: {'idRecips': idRecips},
    );

    final result = await client!.value.mutate(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
  }

  

}