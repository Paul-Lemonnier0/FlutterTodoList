
import 'package:flutter/material.dart';
import 'package:namer_app/app_theme.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    super.key,
    required this.myController,
  });

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },

      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Theme.of(context).colorScheme.field,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.contrast,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2.0,
          ),
        ),
        hintText: 'Nom de la tâche',
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.fontGray,
        ),
      ),
    );
  }
}