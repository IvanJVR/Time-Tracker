import 'package:flutter/material.dart';
import 'package:time_tracker/models/project_model.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

class ProjectProvider with ChangeNotifier {
  final LocalStorage storage;
  List<Project> _projects = [];
  List<Project> get projects => _projects;

  ProjectProvider({required this.storage}) {
    _loadProjectsFromStorage();
  }

  void addProject(Project project) {
    _projects.add(project);
    _saveToStorage();
    notifyListeners();
  }

  void deleteProject(String id) {
    _projects.removeWhere((project) => project.id == id);
    _saveToStorage();
    notifyListeners();
  }

  void _loadProjectsFromStorage() {
    var data = storage.getItem("projects");
    if (data != null) {
      _projects = List<Project>.from(
        (jsonDecode(data) as List).map(
          (item) => Project.fromMap(item as Map<String, dynamic>),
        ),
      );
      notifyListeners();
    } else {
      _addDefault();
      _saveToStorage();
    }
  }

  void _saveToStorage() {
    storage.setItem(
      'projects',
      jsonEncode(_projects.map((project) => project.toMap()).toList()),
    );
  }

  void _addDefault() {
    addProject(Project(id: "Default", name: "Personal"));
    _saveToStorage();
    notifyListeners();
  }

  String getProjectNameById(String id) {
    try {
      return _projects.firstWhere((project) => project.id == id).name;
    } catch (e) {
      return "Proyecto no encontrado";
    }
  }
}
