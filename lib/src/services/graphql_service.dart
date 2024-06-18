import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static Future<GraphQLClient> generateClient({required bool useCache}) async {
    final link = HttpLink('http://localhost:4000/');

    final client = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );

    return client;
  }
}
