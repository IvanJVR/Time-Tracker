class Task {
  final String id;
  final String name;
  Task({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(id: map['id'], name: map['name']);
  }
}
