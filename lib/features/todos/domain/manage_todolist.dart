import 'package:stik/features/todos/domain/todo.dart';

import 'package:uuid/uuid.dart';

import 'todos_repository.dart';
import 'use_cases.dart';

class ManageTodoList implements ManageTodoListUseCase {
  final TodosRepository _repository;

  ManageTodoList(this._repository);

  @override
  Future<Todo> createTodo(Uuid ownerId, String name, String description) async {
    return await _repository.saveTodo(name, description, ownerId);
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    return await _repository.deleteTodo(todo);
  }

  @override
  Future<List<Todo>> getAllOpenTodos(Uuid ownerId) async {
    return await _repository.getAllOpenTodos(ownerId);
  }
    @override
  Future<void> updateTodo(Todo todo) async {
    return await _repository.updateTodo(todo);
  }

  @override
  Future<void> markTodoCompleted(Todo todo) async {
    todo.completed = true;
    return await _repository.updateTodo(todo);
  }

  @override
  Future<void> markTodoUnCompleted(Todo todo) async {
    todo.completed = false;
    return await _repository.updateTodo(todo);
  }
}