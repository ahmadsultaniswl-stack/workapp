class Task {
  String title;
  DateTime createdAt;
  bool isDone;

  Task({required this.title, required this.createdAt, this.isDone = false});

  // 🔹 Map me convert
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'createdAt': createdAt.toIso8601String(),
      'isDone': isDone,
    };
  }

  // 🔹 Map se object
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      createdAt: DateTime.parse(map['createdAt']),
      isDone: map['isDone'],
    );
  }
}
