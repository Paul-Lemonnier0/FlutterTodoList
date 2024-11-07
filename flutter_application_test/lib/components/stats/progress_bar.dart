
import 'package:flutter/material.dart';
import 'package:namer_app/app_theme.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded( // Utilisez Expanded pour donner une largeur contrainte
        child: LinearProgressIndicator(
          value: value,
          borderRadius: BorderRadius.circular(10),
          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.contrast),
        )
      ),
      SizedBox(width: 20),
      Text(
        '${(value * 100).toStringAsFixed(0)}%',
        style: Theme.of(context).textTheme.bodySmall,
      )
    ]);
  }
}