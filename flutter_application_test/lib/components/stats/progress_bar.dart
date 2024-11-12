
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
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          tween: Tween<double>(
              begin: 0,
              end: value.clamp(0.0, 1.0)
          ),
          builder: (context, value, _) =>
              LinearProgressIndicator(value: value, valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.contrast), borderRadius: BorderRadius.circular(10),)
      ),
      ),
      SizedBox(width: 20),
      Text(
        '${(value * 100).toStringAsFixed(0)}%',
        style: Theme.of(context).textTheme.bodySmall,
      )
    ]);
  }
}