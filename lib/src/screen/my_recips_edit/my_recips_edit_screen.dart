import 'package:flutter/material.dart';

import 'components/body.dart';

class MyRecipsEditScreen extends StatelessWidget {
  static const String routeName = '/my-recips-edit';

  const MyRecipsEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar minhas Receitas'),
      ),
        body: Body());
  }
}
