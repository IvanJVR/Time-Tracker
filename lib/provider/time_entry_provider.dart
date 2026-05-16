import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:time_tracker/models/time_entry_model.dart';

class TimeEntryProvider with ChangeNotifier {
  List<TimeEntry> _entries = [];
  List<TimeEntry> get entries => _entries;
  final LocalStorage storage;

  TimeEntryProvider({required this.storage}) {
    _loadEntriesFromStorage();
  }

  void _loadEntriesFromStorage() {
    var data = storage.getItem("entries");
    if (data != null) {
      _entries = List<TimeEntry>.from(
        (jsonDecode(data) as List).map(
          (item) => TimeEntry.fromMap(item as Map<String, dynamic>),
        ),
      );
      notifyListeners();
    }
  }

  void _saveToStorage() {
    storage.setItem(
      'entries',
      jsonEncode(_entries.map((entry) => entry.toMap()).toList()),
    );
  }

  void addTimeEntry(TimeEntry entry) {
    _entries.add(entry);
    _saveToStorage();
    notifyListeners();
  }

  void deleteTimeEntry(String id) {
    _entries.removeWhere((entry) => entry.id == id);
    _saveToStorage();
    notifyListeners();
  }
}
