import 'package:flutter/material.dart';

class ReceitasDrawer extends StatelessWidget {
  final List<List<String>> dados;

  const ReceitasDrawer({super.key, required this.dados});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red[300]!),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Container(
            color: Colors.red[400],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: dados[0].map((titulo) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    titulo,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dados.length - 1,
            itemBuilder: (context, index) {
              return Container(
                color: index % 2 == 0 ? Colors.grey[200] : Colors.grey[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: dados[index + 1].map((valor) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(valor),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}