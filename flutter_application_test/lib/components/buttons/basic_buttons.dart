
import 'package:flutter/material.dart';
import 'package:namer_app/app_theme.dart';

class BackgroundTextButton extends StatelessWidget {

  const BackgroundTextButton({super.key, required this.onPressed, required this.text, this.isRed = false, this.trailingIcon});

  final VoidCallback onPressed;
  final String text;
  final bool isRed;
  final Icon? trailingIcon;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isRed ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.contrast;

  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
      splashFactory: InkSplash.splashFactory,
      padding: WidgetStatePropertyAll(EdgeInsets.zero), // Ensure no padding from the button itself
    ),
    child: Align(
      alignment: Alignment.center, // Center the button content
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20), // Adjust the button padding
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // This will make the text take available space
          children: [
            Expanded( // This will make the Text take all the remaining space
              child: Text(
                text,
                style: Theme.of(context).textTheme.displaySmall!.merge(
                  TextStyle(color: Theme.of(context).colorScheme.fontContrast),
                ),
              ),
            ),
            SizedBox(width: trailingIcon != null ? 20 : 0),
            trailingIcon ?? Container(),
          ],
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
    this.disabled = false,
    this.isRed = false,
  });

  final VoidCallback onPressed;
  final Icon icon;
  final bool disabled;
  final bool isRed;

  @override
  Widget build(BuildContext context) {

    final bgColor =
      disabled ? Theme.of(context).colorScheme.fontGray :
        isRed ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.contrast;

    return TextButton(

      onPressed: disabled ? null : onPressed,
      style: ButtonStyle(
        splashFactory: InkSplash.splashFactory,
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10), // Ajuste les marges du bouton
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: icon, // Affiche l'icône ici
      ),
    );
  }
}


class BorderIconButton extends StatelessWidget {
  const BorderIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.disabled = false,
    this.isRed = false
  });

  final VoidCallback onPressed;
  final Icon icon;
  final bool disabled;
  final bool isRed;


  @override
  Widget build(BuildContext context) {
    final borderColor =
      disabled ? Theme.of(context).colorScheme.fontGray :
        isRed ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.contrast;

    return TextButton(

      onPressed: disabled ? null : onPressed,
      style: ButtonStyle(
        splashFactory: InkSplash.splashFactory,
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10), // Ajuste les marges du bouton
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
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