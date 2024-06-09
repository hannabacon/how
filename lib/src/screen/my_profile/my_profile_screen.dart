import 'package:flutter/material.dart';
import 'package:how/src/widgets/receitas_base_layout.dart';
import 'components/body.dart';

class MyProfileScreen extends StatelessWidget {
  static const String routeName = '/my-profile';

  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReceitasBaseLayout(body: Body(), title: 'Meu perfil',);
  }
}