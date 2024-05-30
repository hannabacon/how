import 'package:flutter/material.dart';
import 'package:how/src/widgets/receitas_base_layout.dart';

import 'components/body.dart';

class MyRecipsEditScreen extends StatelessWidget {
  static const String routeName = '/my-recips-edit';

  const MyRecipsEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReceitasBaseLayout(body: Body());
  }
}
