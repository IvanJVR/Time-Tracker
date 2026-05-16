class Project {
  final String id;
  final String name;
  Project({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(id: map['id'], name: map['name']);
  }
}
