import 'package:flutter/material.dart';
import 'package:how/src/widgets/receitas_base_layout.dart';

import 'components/body.dart';

class CreateUserScreen extends StatelessWidget {
  static const String routeName = '/create-user';

  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReceitasBaseLayout(
      body: Body(), 
      title: "Criar Conta"
    );
  }
}