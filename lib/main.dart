import 'package:flutter/material.dart';
import 'package:how/src/screen/create_recips/create_recips_screen.dart';
import 'package:how/src/screen/create_user/create_user_screen.dart';
import 'package:how/src/screen/home_details/home_details_screen.dart';
import 'package:how/src/screen/home_screen/home_screen.dart';
import 'package:how/src/screen/login/login_screen.dart';
import 'package:how/src/screen/my_profile/my_profile_screen.dart';
import 'package:how/src/screen/my_recips/my_recips_screen.dart';
import 'package:how/src/screen/my_recips_edit/my_recips_edit_screen.dart';
import 'package:how/src/screen/my_recips_fav/my_recips_fav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'How to Cook',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        MyRecipsFavScreen.routeName: (context) => const MyRecipsFavScreen(),
        MyRecipsScreen.routeName: (context) => const MyRecipsScreen(),
        MyRecipsEditScreen.routeName: (context) => const MyRecipsEditScreen(),
        CreateRecipsScreen.routeName: (context) => const CreateRecipsScreen(),
        MyProfileScreen.routeName: (context) => const MyProfileScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        CreateUserScreen.routeName: (context) => const CreateUserScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == HomeDetailsScreen.routeName) {
          final idRecips = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) {
              return HomeDetailsScreen(idRecips: idRecips);
            },
          );
        }
        return null;
      },
    );
  }
}
