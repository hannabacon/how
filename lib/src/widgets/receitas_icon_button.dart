import 'package:flutter/material.dart';
import 'package:how/src/services/recips_service.dart';

class RecipeIconButton extends StatefulWidget {
  final String idRecips;

  const RecipeIconButton({Key? key, required this.idRecips}) : super(key: key);

  @override
  _RecipeIconButtonState createState() => _RecipeIconButtonState();
}

class _RecipeIconButtonState extends State<RecipeIconButton> {
  bool isFavorite = false; // Estado inicial, não favorito

  Future<void> toggleFavorite() async {
    if (!isFavorite) {
      // Se não for favorito, atualize para favorito
      await updateRecipeType(widget.idRecips, "2");
      setState(() {
        isFavorite = true; // Atualiza o estado para refletir a mudança
      });
    }
    // Adicione lógica para desfazer o favorito, se necessário
  }

  Future<void> updateRecipeType(String idRecips, String newType) async {
    Map<String, dynamic> data = {
      'idRecips': idRecips,
      'type': newType,
    };

    await RecipsService().updateRecips(data);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          size: 30,
          color: Colors.red,
        ),
        onPressed: toggleFavorite,
      ),
    );
  }
}