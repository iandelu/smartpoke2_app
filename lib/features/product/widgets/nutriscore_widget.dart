import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NutriScoreWidget extends StatelessWidget {
  final String score;

  NutriScoreWidget({required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildNutriScoreLetter("A", Colors.green, score == "a"),
          _buildNutriScoreLetter("B", Colors.lightGreen, score == "b"),
          _buildNutriScoreLetter("C", Colors.yellow, score == "c"),
          _buildNutriScoreLetter("D", Colors.orange, score == "d"),
          _buildNutriScoreLetter("E", Colors.red, score == "e"),
        ],
      ),
    );
  }

  Widget _buildNutriScoreLetter(String letter, Color color, bool isSelected) {
    return Container(
      height: isSelected ? 64 : 45,
      width: isSelected ? 36 : 30,
      decoration: BoxDecoration(
        color: color,
        borderRadius: isSelected ? BorderRadius.circular(18.0) : letter == "A"
            ? BorderRadius.only(topLeft: Radius.circular(12.0), bottomLeft: Radius.circular(12.0))
            : letter == "E"
            ? BorderRadius.only(topRight: Radius.circular(12.0), bottomRight: Radius.circular(12.0)) : null,
        border: isSelected ? Border.all(color: Colors.white, width: 3.0) : null,
      ),
      child:  Center(
        child: Text(
            letter,
            style: TextStyle(
              fontSize: isSelected ? 28 : 22,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
            ),
          ),
      ),
    );
  }
}


