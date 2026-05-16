import 'package:flutter/material.dart';
import 'package:time_tracker/models/task_model.dart';

class TasktCard extends StatelessWidget{
  final Task task;
  final int index;

  const TasktCard({
    super.key,
    required this.task,
    required this.index,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          '${index + 1}) ${task.name}',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}