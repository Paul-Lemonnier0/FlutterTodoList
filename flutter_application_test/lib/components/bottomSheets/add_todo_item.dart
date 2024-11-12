import 'package:flutter/material.dart';
import 'package:namer_app/components/buttons/basic_buttons.dart';
import 'package:namer_app/components/inputs/text_input.dart';

class AddTodoItem extends StatelessWidget{
  const AddTodoItem({super.key, required this.onSubmit, required this.controller});

  final VoidCallback onSubmit;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
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

              CustomTextInput(myController: controller),

              Spacer(),

              BackgroundTextButton(
                onPressed: () {
                  onSubmit();
                },
                trailingIcon: Icon(
                  Icons.arrow_upward,
                  size: 25
                ),
                text: "Ajouter"
              )
            ],
          ),
          ),
      ),
    );
  }
}