import 'package:flutter/material.dart';
import 'package:how/src/widgets/receitas_base_layout.dart';
import 'components/body.dart';

class MyRecipsFavScreen extends StatelessWidget {
  static String routeName = '/my-recips-fav';

  const MyRecipsFavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReceitasBaseLayout(body: Body());
  }
}