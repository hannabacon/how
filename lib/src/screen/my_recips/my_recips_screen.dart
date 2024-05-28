import 'package:flutter/material.dart';
import 'package:how/src/screen/home_screen/components/body.dart';
import 'package:how/src/widgets/receitas_base_layout.dart';

class MyRecipsScreen extends StatelessWidget {
  static String routeName = '/my-recips';

  const MyRecipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReceitasBaseLayout(body: Body());
  }
}