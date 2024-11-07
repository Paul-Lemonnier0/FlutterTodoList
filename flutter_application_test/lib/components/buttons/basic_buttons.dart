
import 'package:flutter/material.dart';
import 'package:namer_app/app_theme.dart';

class BackgroundTextButton extends StatelessWidget {

  const BackgroundTextButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        splashFactory: InkSplash.splashFactory,
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30), // Ajuste les marges du bouton
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.contrast,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.displaySmall!.merge(
              TextStyle(color: Theme.of(context).colorScheme.fontContrast),
            ),
        ),
      ),
    );
  }
}

class BackgroundIconButton extends StatelessWidget {
  const BackgroundIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.disabled,
  });

  final VoidCallback onPressed;
  final Icon icon;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(

      onPressed: disabled ? null : onPressed,
      style: ButtonStyle(
        splashFactory: InkSplash.splashFactory,
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10), // Ajuste les marges du bouton
        decoration: BoxDecoration(
          color: disabled ? Theme.of(context).colorScheme.fontGray : Theme.of(context).colorScheme.contrast,
          borderRadius: BorderRadius.circular(15),
        ),
        child: icon, // Affiche l'icône ici
      ),
    );
  }
}



class BorderButton extends StatelessWidget {

  const BorderButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30), // Ajuste les marges du bouton
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.field,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}