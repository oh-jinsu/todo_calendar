import 'package:todo/models/option.dart';

class TodoItem {
  final int id;
  final String content;
  final DateTime? doneAt;
  final DateTime createdAt;

  const TodoItem({
    required this.id,
    required this.content,
    required this.doneAt,
    required this.createdAt,
  });

  factory TodoItem.fromMap(dynamic map) {
    return TodoItem(
      id: map["id"],
      content: map["content"],
      doneAt: map["doneAt"] != null ? DateTime.parse(map["doneAt"]) : null,
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }

  TodoItem copy({
    int? id,
    String? content,
    Option<DateTime>? doneAt,
    DateTime? createdAt,
  }) {
    return TodoItem(
      id: id ?? this.id,
      content: content ?? this.content,
      doneAt: doneAt != null ? doneAt.value : this.doneAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
