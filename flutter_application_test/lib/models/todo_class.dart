import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class TodoItem {
  String title;
  bool isDone;
  String id;
  DateTime creationDate;

  TodoItem({required this.title, this.isDone = false, String? id, DateTime? creationDate})
      : id = id ?? Uuid().v4(),
        creationDate = creationDate ?? DateTime.now();

  void toggleDone() {
    isDone = !isDone;
  }

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      title: json['title'],
      isDone: json['isDone'],
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
    );
  }
}

class TodoList extends ChangeNotifier { // Extend ChangeNotifier
  List<TodoItem> items = [];
  String _selectedItem = '';

  TodoList() {
    fetchItems();
  }

  Future<List<TodoItem>> fetchItems() async {
    var url = Uri.http('10.0.2.2:8080', '/list');
    var response = await http.get(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final List<dynamic> todosJson = jsonDecode(response.body);
      items = todosJson.map((json) => TodoItem.fromJson(json)).toList();
      notifyListeners();
    }

    else {
      print('Error: ${response.statusCode}');
    }

    return [];
  }

  Future<void> addItem(TodoItem item) async {
    items.add(item);

    var url = Uri.http('10.0.2.2:8080', '/add');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': item.title, 'id': item.id}),
    );

    if (response.statusCode == 200) {
      print("Todo item well added");
    }

    else {
      print('Error: ${response.statusCode}');
    }

    notifyListeners();
  }

  void removeItem(TodoItem item) {
    items.remove(item);
    notifyListeners();
  }

  Future<void> toggleItem(int index) async {
    if (index >= 0 && index < items.length) {
      items[index].toggleDone();

      var url = Uri.http('10.0.2.2:8080', '/update');
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'id': items[index].id, 'isDone': items[index].isDone}),
      );

      if (response.statusCode == 200) {
        print("Todo item well updated");
      }

      else {
        print('Error: ${response.statusCode}');
      }

      notifyListeners();
    }
  }

  void setSelectedItemID(String id) {
    if(_selectedItem == id) {
      _selectedItem = '';
    } else {
      _selectedItem = id;
    }
    notifyListeners();
  }

  bool isItemSelected(String id) {
    return _selectedItem == id;
  }

  Future<void> deleteSelectedItem() async{
      Iterable<TodoItem> selectedItems = items.where((element) => element.id == _selectedItem);


      try {
        TodoItem item = selectedItems.elementAt(0);

        items.remove(item);

        var url = Uri.http('10.0.2.2:8080', '/delete');
        var response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'id': item.id}),
        );

        if (response.statusCode == 200) {
          print("Todo item well deleted");
        }

        else {
          print('Error: ${response.statusCode}');
        }

        _selectedItem = '';
        notifyListeners();
      }

      catch(e) {
        print("No item selected");
        return;
      }


  }

  bool hasSelectedItem() {
    return _selectedItem.isNotEmpty;
  }

  String get selectedItemID => _selectedItem;
}
