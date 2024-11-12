import 'package:flutter/material.dart';
import 'package:namer_app/app_theme.dart';
import 'package:namer_app/components/bottomSheets/add_todo_item.dart';

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
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void handleOnPress(String text) {
    widget.onPressed(text);
    controller.clear();
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
            return AddTodoItem(onSubmit: () { handleOnPress(controller.text); }, controller: controller);
          }
        );
      },

    );
  }
}