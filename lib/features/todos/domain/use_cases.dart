import 'package:uuid/uuid.dart';
import "todo.dart";

abstract class ManageTodoListUseCase {
  Future<Todo> createTodo(Uuid ownerId, String name, String description);

  Future<void> deleteTodo(Todo todo);

  Future<List<Todo>> getAllOpenTodos(Uuid ownerId);

  Future<void> updateTodo(Todo todo);

  Future<void> markTodoCompleted(Todo todo);

  Future<void> markTodoUnCompleted(Todo todo);
}