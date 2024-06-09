import 'package:flutter/material.dart';

import 'components/body.dart';

class HomeDetailsScreen extends StatelessWidget {
  static const String routeName = '/home-details';

  const HomeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes da Receita'),
      ),
        body: Body());
  }
}