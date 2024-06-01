import 'package:flutter/material.dart';
import 'package:how/src/widgets/receitas_base_layout.dart';

import 'components/body.dart';

class HomeDetailsScreen extends StatelessWidget {
  static const String routeName = '/home-details';

  const HomeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReceitasBaseLayout(body: Body());
  }
}