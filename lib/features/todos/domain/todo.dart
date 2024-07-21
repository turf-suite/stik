import 'package:uuid/uuid.dart';

class Todo {
  String name;
  String description;
  DateTime? dueDate;
  bool completed;
  final DateTime createdAt;
  final Uuid ownerId;
  final int id;

  Todo({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.description,
    required this.createdAt,
    this.dueDate,
    this.completed = false
  });
}