import 'package:stik/features/todos/domain/todo.dart';

import 'package:uuid/uuid.dart';

import 'todos_repository.dart';
import 'use_cases.dart';

class CreateTodo implements ManageTodoListUseCase {
  final TodosRepository _repository;

  CreateTodo(this._repository);

  @override
  Future<Todo> createTodo(Uuid ownerId, String name, String description) async {
    return await _repository.saveTodo(name, description, ownerId);
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    return await _repository.deleteTodo(todo);
  }
}