class TimeEntry {
  final String id;
  final String projectId;
  final String taskId;
  final double totalTime;
  final DateTime date;
  final String notes;

  TimeEntry({
    required this.id,
    required this.projectId,
    required this.taskId,
    required this.totalTime,
    required this.date,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'projectId': projectId,
      'taskId': taskId,
      'totalTime': totalTime,
      'date': date.toIso8601String(),
      'notes': notes,
    };
  }

  factory TimeEntry.fromMap(Map<String, dynamic> map) {
    return TimeEntry(
      id: map['id'],
      projectId: map['projectId'],
      taskId: map['taskId'],
      totalTime: map['totalTime'],
      date: DateTime.parse(map['date']),
      notes: map['notes'],
    );
  }
}
