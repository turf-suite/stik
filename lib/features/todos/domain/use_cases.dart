import 'package:uuid/uuid.dart';
import "todo.dart";

abstract class ManageTodoListUseCase {
  Future<Todo> createTodo(Uuid ownerId, String name, String description);

  Future<void> deleteTodo(Todo todo);
}

abstract class ManageTodoUseCase {
  Future<void> updateTodoName(Todo todo, String newName);

  Future<void> updateTodoDescription(Todo todo, String newDescription);

  Future<void> markTodoCompleted(Todo todo);

  Future<void> markTodoUnCompleted(Todo todo);
}