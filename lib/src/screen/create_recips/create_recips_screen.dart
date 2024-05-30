import 'package:flutter/material.dart';
import 'package:how/src/widgets/receitas_base_layout.dart';

import 'components/body.dart';

class CreateRecipsScreen extends StatelessWidget {
  static const String routeName = '/create-recips';

  const CreateRecipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReceitasBaseLayout(body: Body());
  }
}
