import 'package:flutter/material.dart';
import 'package:how/src/screen/home_screen/components/body.dart';
import 'package:how/src/widgets/receitas_base_layout.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReceitasBaseLayout(
        body: Body(), title: 'How to Cook',
      ),
    );
  }
}