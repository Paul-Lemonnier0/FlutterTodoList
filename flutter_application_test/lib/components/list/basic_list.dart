import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:namer_app/app_theme.dart';
import 'package:namer_app/components/buttons/check_button.dart';
import 'package:namer_app/models/todo_class.dart';
import 'package:provider/provider.dart';

class BasicCustomList extends StatefulWidget {
  const BasicCustomList({super.key});

  @override
  State<BasicCustomList> createState() => _BasicCustomList();
}

class _BasicCustomList extends State<BasicCustomList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoList>( // Use Consumer to listen to TodoList changes
      builder: (context, todoList, child) {
        return AnimatedList(
          key: todoList.animatedListKey,
          itemBuilder: (BuildContext context, int index, Animation<double> animation) {
          final todo = todoList.items[index];

          return FadeTransition(
            key: UniqueKey(),
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: TodoDoListItem(
                      todo: todo,
                      onToggle: () {
                        todoList.toggleItem(index);
                      },
                      setSelectedTodoItem: (String id) {
                        todoList.setSelectedItemID(id);
                      },
                      isSelected: todoList.isItemSelected(todo.id),
                  ),
            )
              );
          }
        );
      },
    );
  }
}

class TodoDoListItem extends StatefulWidget {
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
  _TodoDoListItemState createState() => _TodoDoListItemState();
}

class _TodoDoListItemState extends State<TodoDoListItem> {
  @override
  Widget build(BuildContext context) {
    final double opacity = widget.todo.isDone ? 0.7 : 1;

    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: ModalRoute.of(context)!.animation!,
        curve: Curves.easeOut,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: Opacity(
          opacity: opacity,
          child: GestureDetector(
            onTap: () {
              widget.setSelectedTodoItem(widget.todo.id);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.field,
                border: Border.all(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.contrast
                      : Theme.of(context).colorScheme.secondary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          widget.todo.title,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                decoration: widget.todo.isDone
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: Theme.of(context).colorScheme.font,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckButton(
                        onPressed: () {
                          // Call the toggle function, update the state
                          widget.onToggle();
                          setState(() {}); // Force rebuild to reflect the change
                        },
                        isChecked: widget.todo.isDone,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
