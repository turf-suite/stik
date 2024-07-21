import 'package:uuid/uuid.dart';
import "todo.dart";

abstract class CreateTodoUseCase {
  Future<Todo> execute(Uuid ownerId, String name, String description);
}

abstract class ManageTodoUseCase {
  Future<void> updateTodoName(Todo todo, String newName);

  Future<void> updateTodoDescription(Todo todo, String newDescription);

  Future<void> markTodoCompleted(Todo todo);

  Future<void> markTodoUnCompleted(Todo todo);

  Future<void> deleteTodo(Todo todo);
}