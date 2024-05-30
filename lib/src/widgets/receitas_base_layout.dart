import 'package:flutter/material.dart';

class ReceitasBaseLayout extends StatelessWidget {
  final Widget body;

  const ReceitasBaseLayout({super.key, required this.body});

  void navigateToPage(BuildContext context, String route) {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.red,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 8, bottom: 16, right: 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: SafeArea(
                    child: Text(
                      'Receita das meninas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'MENU',
                                style: TextStyle(color: Colors.white),
                              ))),
                      Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.bar_chart_outlined,
                                color: Colors.white),
                            title: const Text('Home',
                                style: TextStyle(color: Colors.white)),
                            trailing: const Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            onTap: () => navigateToPage(context, '/home'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Divider(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'MINHAS RECEITAS',
                                style: TextStyle(color: Colors.white),
                              ))),
                      Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.favorite_border_outlined,
                                color: Colors.white),
                            title: const Text('Minhas Receitas Salvas',
                                style: TextStyle(color: Colors.white)),
                            trailing: const Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            onTap: () => Navigator.pushNamed(context, '/my-recips-fav'),

                          ),
                          ListTile(
                            leading: const Icon(
                                Icons.cake,
                                color: Colors.white),
                            title: const Text('Minhas Receitas',
                                style: TextStyle(color: Colors.white)),
                            trailing: const Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            onTap: () => Navigator.pushNamed(context, '/my-recips'),

                          ),
                          ListTile(
                            leading: const Icon(Icons.person,
                                color: Colors.white),
                            title: const Text('Meu perfil',
                                style: TextStyle(color: Colors.white)),
                            trailing: const Icon(Icons.keyboard_arrow_right,
                                color: Colors.white),
                            onTap: () => Navigator.pushNamed(context, '/my-profile'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
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
      body: body,
    );
  }
}