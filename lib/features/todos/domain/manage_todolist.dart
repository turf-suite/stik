import 'package:stik/core/auth/user.dart';
import 'package:stik/features/todos/domain/todo.dart';

import 'todos_repository.dart';
import 'use_cases.dart';

class ManageTodoList implements ManageTodoListUseCase {
  final TodosRepository _repository;
  final User _user;

  ManageTodoList(this._repository, this._user);

  @override
  Future<Todo> createTodo(String name, String description) async {
    return await _repository.saveTodo(name, description, _user.id);
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    return await _repository.deleteTodo(todo);
  }

  @override
  Future<List<Todo>> getAllOpenTodos() async {
    return await _repository.getAllOpenTodos(_user.id);
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