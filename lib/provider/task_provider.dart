import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:time_tracker/models/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;
  final LocalStorage storage;

  TaskProvider({required this.storage}) {
    _loadTasksFromStorage();
  }

  void _loadTasksFromStorage() {
    var data = storage.getItem("tasks");
    if (data != null) {
      _tasks = List<Task>.from(
        (jsonDecode(data) as List).map(
          (item) => Task.fromMap(item as Map<String, dynamic>),
        ),
      );
      notifyListeners();
    }
  }

  void _saveToStorage() {
    storage.setItem(
      'tasks',
      jsonEncode(_tasks.map((task) => task.toMap()).toList()),
    );
  }

  void addTask(Task task) {
    _tasks.add(task);
    _saveToStorage();
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    _saveToStorage();
    notifyListeners();
  }

    String getTaskNameById(String id){
    try{
      return _tasks.firstWhere((task) => task.id == id).name;
    } catch(e){
      return "Tarea no encontrada";
    }
  }
}
