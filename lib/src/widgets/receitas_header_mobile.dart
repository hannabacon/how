import 'package:flutter/material.dart';

class ReceitasHeaderMobile extends StatelessWidget {
  final VoidCallback onOpenDrawer;
  final Widget? title;
  final List<Widget>? actions;

  const ReceitasHeaderMobile({
    super.key,
    required this.onOpenDrawer,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                onOpenDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.white),
            ),
            title: const Text('Receita das meninas',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white)),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
