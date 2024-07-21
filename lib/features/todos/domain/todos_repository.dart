import 'package:uuid/uuid.dart';
import 'todo.dart';

abstract class TodosRepository {
  Future<Todo> saveTodo(String name, String description, Uuid owner);

  Future<void> updateTodo(Todo todo);

  Future<void> completeTodo(Todo todo);

  Future<void> uncompleteTodo(Todo todo);

  Future<void> deleteTodo(Todo todo);

  Future<List<Todo>> getAllOpenTodos(Uuid ownerId);

  Future<List<Todo>> getTodosDueBetween(Uuid ownerId, DateTime start, DateTime end);

  Future<List<Todo>> getTodosCompletedOn(Uuid ownerId, DateTime dueDate);
}