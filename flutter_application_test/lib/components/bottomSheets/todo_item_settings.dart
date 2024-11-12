import 'package:flutter/material.dart';
import 'package:namer_app/components/buttons/basic_buttons.dart';
import 'package:namer_app/components/inputs/text_input.dart';
import 'package:namer_app/models/todo_class.dart';

class TodoItemSettings extends StatelessWidget {
  const TodoItemSettings({
    super.key,
    required this.todo,
    required this.onDelete,
    required this.onEdit,
    required this.controller,
  });

  final TodoItem todo;
  final VoidCallback onDelete;
  final TextEditingController controller;
  final Function(String) onEdit;


  @override
  Widget build(BuildContext context) {

    void handleDelete() {
      onDelete();
      controller.clear();
      Navigator.pop(context);
    }

    void handleEdit() {
      onEdit(controller.text);
      controller.clear();
      Navigator.pop(context);
    }

    return Container(
      height: 400,
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Modifier une tâche',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 20),
              CustomTextInput(myController: controller),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the buttons horizontally
                children: [
                  Expanded(
                    child: BackgroundTextButton(
                      onPressed: handleEdit,
                      trailingIcon: Icon(Icons.check, size: 22),
                      text: "Valider",
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: BackgroundTextButton(
                      onPressed: handleDelete,
                      trailingIcon: Icon(Icons.close, size: 22),
                      isRed: true,
                      text: "Supprimer",
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
