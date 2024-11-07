import 'package:flutter/material.dart';
import 'package:namer_app/app_theme.dart';

class CheckButton extends StatelessWidget {
  const CheckButton({
    super.key,
    required this.onPressed,
    required this.isChecked,
  });

  final VoidCallback onPressed;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5.0), // Add some padding around the icon
        decoration: BoxDecoration(
          color: isChecked ? Theme.of(context).colorScheme.contrast : Colors.transparent,
          borderRadius: BorderRadius.circular(60.0), // Rounded corners
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
        ),
        child: Icon(
          Icons.check,
          color: isChecked ? Theme.of(context).colorScheme.fontContrast : Colors.transparent,
          size: 20,
        ) ,
      ),
    );
  }
}
