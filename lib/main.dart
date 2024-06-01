import 'package:flutter/material.dart';
import 'package:how/src/screen/create_recips/create_recips_screen.dart';
import 'package:how/src/screen/home_details/home_details_screen.dart';
import 'package:how/src/screen/home_screen/home_screen.dart';
import 'package:how/src/screen/my_profile/my_profile_screen.dart';
import 'package:how/src/screen/my_recips/my_recips_screen.dart';
import 'package:how/src/screen/my_recips_edit/my_recips_edit_screen.dart';
import 'package:how/src/screen/my_recips_fav/my_recips_fav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 250, 138, 130),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
          
        ),
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        MyRecipsFavScreen.routeName: (context) => const MyRecipsFavScreen(),
        MyRecipsScreen.routeName: (context) => const MyRecipsScreen(),
        MyRecipsEditScreen.routeName: (context) => const MyRecipsEditScreen(),
        CreateRecipsScreen.routeName: (context) => const CreateRecipsScreen(),
        MyProfileScreen.routeName: (context) => const MyProfileScreen(),
        HomeDetailsScreen.routeName: (context) => const HomeDetailsScreen(),
      },
    );
  }
}
