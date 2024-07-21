import "todo.dart";

abstract class ManageTodoListUseCase {
  Future<Todo> createTodo(String name, String description);

  Future<void> deleteTodo(Todo todo);

  Future<List<Todo>> getAllOpenTodos();

  Future<void> updateTodo(Todo todo);

  Future<void> markTodoCompleted(Todo todo);

  Future<void> markTodoUnCompleted(Todo todo);
}