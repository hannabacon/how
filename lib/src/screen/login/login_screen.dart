import 'package:flutter/material.dart';
import 'package:how/src/widgets/receitas_base_layout.dart';

import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReceitasBaseLayout(
      body: Body(), 
      title: "How to Cook");
  }
}