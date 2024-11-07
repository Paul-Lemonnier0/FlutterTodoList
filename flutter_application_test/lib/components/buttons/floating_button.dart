import 'package:flutter/material.dart';
import 'package:namer_app/app_theme.dart';
import 'package:namer_app/components/buttons/basic_buttons.dart';
import 'package:namer_app/components/inputs/text_input.dart';

class AddFloatingButton extends StatefulWidget {
  const AddFloatingButton({
    super.key,
    required this.onPressed
  });

  final void Function(String) onPressed;

  @override
  State<AddFloatingButton> createState() => _AddFloatingButtonState();
}

class _AddFloatingButtonState extends State<AddFloatingButton> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void handleOnPress(String text) {
    widget.onPressed(text);
    myController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.contrast,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(600),
      ),
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.fontContrast,
        size: 25,
      ),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 400,
              color: Theme.of(context).colorScheme.primary,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Ajouter une tâche',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),

                    SizedBox(height: 20),

                    CustomTextInput(myController: myController),

                    Spacer(),

                    BackgroundTextButton(
                      onPressed: () {
                        handleOnPress(myController.text);
                      },
                      text: "Ajouter"
                    )
                  ],
                ),
                ),
            ),
            );
          }
        );
      },

    );
  }
}