import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/config/theme/brut_shadows.dart';

class NeuProgressBarIndicator extends StatelessWidget {
  const NeuProgressBarIndicator({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: black1,
                  width: 2.0
              ),
              boxShadow: [shadowMediumBrut]
          ),
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(16),
            semanticsValue: 'Progreso de la lista de compras',
            value: progress,
            minHeight: 25.0,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(accentTeal1),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Text(
              '${(progress * 100).toInt()}%',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),

      ],
    );
  }
}
