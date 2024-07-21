import 'package:stik/features/todos/domain/todo.dart';

import 'use_cases.dart';
import 'todos_repository.dart';

class ManageTodo implements ManageTodoUseCase {
  final TodosRepository _repository;

  ManageTodo(this._repository);

  @override
  Future<void> updateTodoName(Todo todo, String newName) async {
    todo.name = newName;
    return await _repository.updateTodo(todo);
  }

  @override
  Future<void> updateTodoDescription(Todo todo, String newDescription) async {
    todo.description = newDescription;
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