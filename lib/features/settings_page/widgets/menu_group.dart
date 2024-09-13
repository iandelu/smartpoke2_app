import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/config/theme/brut_shadows.dart';
import 'menu_tile.dart'; // Asegúrate de importar MenuTile

class MenuGroup extends StatelessWidget {
  final List<MenuTile> tiles;
  final Color backgroundColor;

  MenuGroup({required this.tiles, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: EdgeInsets.all(16.0),
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(
          color: black1,
          width: 3.0
        ),
        color: backgroundColor,
        boxShadow: [shadowSmallBrut]
      ),
      child: Column(
        children: tiles,
      ))
    );
  }
}
