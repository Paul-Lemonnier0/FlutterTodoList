import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:namer_app/app_theme.dart';
import 'package:namer_app/components/buttons/check_button.dart';
import 'package:namer_app/models/todo_class.dart';
import 'package:provider/provider.dart';

class BasicCustomList extends StatelessWidget {
  const BasicCustomList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoList>( // Use Consumer to listen to TodoList changes
      builder: (context, todoList, child) {
        return ListView.builder(
          itemCount: todoList.items.length,
          itemBuilder: (context, index) {
            final todo = todoList.items[index];
            return TodoDoListItem(
              todo: todo,
              onToggle: () {
                todoList.toggleItem(index);
              },
              setSelectedTodoItem: (String id) {
                todoList.setSelectedItemID(id);
              },
              isSelected: todoList.isItemSelected(todo.id),
            );
          },
        );
      },
    );
  }
}

class TodoDoListItem extends StatelessWidget {
  const TodoDoListItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.setSelectedTodoItem,
    required this.isSelected,
  });

  final TodoItem todo;
  final VoidCallback onToggle;
  final void Function(String) setSelectedTodoItem;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {

    final double opacity = todo.isDone ? 0.7 : 1;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: Opacity(
        opacity: opacity,
        child: GestureDetector( // Utiliser GestureDetector ou InkWell ici

          onTap: () {
            setSelectedTodoItem(todo.id); // L'action sur tap
          },

          child: Container(

          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.field,
            border: Border.all(
              color: isSelected ? Theme.of(context).colorScheme.contrast : Theme.of(context).colorScheme.secondary,
              width: 2,
            ), // Background color
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
          child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    // Retirer onTap de ListTile
                    title: Text(
                      todo.title,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        decoration: todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
                        color: Theme.of(context).colorScheme.font,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CheckButton(onPressed: onToggle, isChecked: todo.isDone),
                ),
              ],
            ),
          ),
        )

        ),
      ),
    );
  }
}
