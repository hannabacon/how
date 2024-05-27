import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class ReceitasLoading extends StatefulWidget {
  const ReceitasLoading({super.key});

  @override
  State<ReceitasLoading> createState() => _ReceitasLoadingState();

  }

  class _ReceitasLoadingState extends State<ReceitasLoading> {

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RiveAnimation.asset(
        'assets/animations/fofo.riv',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}