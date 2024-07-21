import 'package:stik/features/todos/domain/todo.dart';

import 'package:uuid/uuid.dart';

import 'todos_repository.dart';
import 'use_cases.dart';

class CreateTodo implements CreateTodoUseCase {
  final TodosRepository _repository;

  CreateTodo(this._repository);

  @override
  Future<Todo> execute(Uuid ownerId, String name, String description) async {
    return await _repository.saveTodo(name, description, ownerId);
  }
}