import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

class Functions {
  // generate graphql client
  static Future<ValueNotifier<GraphQLClient>> generateGraphQLClient(
      {bool useCache = true}) async {
    await initHiveForFlutter();

    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // final String token = sharedPreferences.getString('token') ?? '';

    // final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // final String token = sharedPreferences.getString('token') ?? '';

    final HttpLink httplink = HttpLink('${Constants.apiUrl}/graphql');
    // final AuthLink authlink = AuthLink(getToken: () => token);
    // final Link link = authlink.concat(httplink);
    final Link link = httplink;
    final ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: useCache ? GraphQLCache(store: HiveStore()) : GraphQLCache(),
        link: link,
      ),
    );

    return client;
  }

  static showScaffoldMessage(BuildContext context, String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  static String formatDate(String dateStr) {
    tz.initializeTimeZones();
    var brasilia = tz.getLocation('America/Sao_Paulo');
    var date = tz.TZDateTime.parse(brasilia, dateStr);
    return DateFormat('dd/MM/yyyy').format(date);
  }
}