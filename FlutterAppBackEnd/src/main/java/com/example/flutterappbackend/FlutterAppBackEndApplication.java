package com.example.flutterappbackend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@SpringBootApplication
@RestController
public class FlutterAppBackEndApplication {

	@Autowired
	private TodoItemRepository repository;

	public static void main(String[] args) {
		SpringApplication.run(FlutterAppBackEndApplication.class, args);
	}

	@PostMapping("/hello")
	public Map<String, String> sayHello(@RequestBody Map<String, String> body) {
		String name = body.get("name");
		return Map.of("message", "Hello, " + name + "!");
	}

	@PostMapping("/add")
	public void add(@RequestBody Map<String, String> body) {
		String id = body.get("id");
		String title = body.get("title");
		repository.save(new TodoItem(id, title));
	}

	@PostMapping("/updateTitle")
	public void updateTitle(@RequestBody Map<String, String> body) {
		String id = body.get("id");
		String title = body.get("title");
		String isDoneStr = body.get("isDone");

		boolean isDone = Boolean.parseBoolean(isDoneStr);

		repository.save(new TodoItem(id, title, isDone));
	}

	@PostMapping("/update")
	public void update(@RequestBody Map<String, String> body) {
		String id = body.get("id");
		boolean isDone = Boolean.parseBoolean(body.get("isDone"));
		TodoItem todoItem = repository.findTodoItemsById(id);
		todoItem.setIsDone(isDone);
		repository.save(todoItem);
	}

	@PostMapping("/delete")
	public void delete(@RequestBody Map<String, String> body) {
		String id = body.get("id");
		repository.deleteTodoItemById(id);
	}

	@GetMapping("/list")
	public Iterable<TodoItem> list() {
		return repository.findAll();
	}
}
