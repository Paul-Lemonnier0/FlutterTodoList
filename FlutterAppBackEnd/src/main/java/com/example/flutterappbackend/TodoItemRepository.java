package com.example.flutterappbackend;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface TodoItemRepository extends MongoRepository<TodoItem, String> {
    public TodoItem findTodoItemsById(String id);
    public void deleteTodoItemById(String id);
}
