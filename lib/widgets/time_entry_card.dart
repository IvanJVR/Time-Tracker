import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/time_entry_model.dart';
import 'package:time_tracker/provider/project_provider.dart';
import 'package:time_tracker/provider/task_provider.dart';
import 'package:time_tracker/provider/time_entry_provider.dart';

class TimeEntryCard extends StatelessWidget {
  final TimeEntry timeEntry;

  const TimeEntryCard({super.key, required this.timeEntry});

  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectProvider>(context);
    final taskProvider = Provider.of<TaskProvider>(context);

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              "${projectProvider.getProjectNameById(timeEntry.projectId)} ${taskProvider.getTaskNameById(timeEntry.taskId)}",
            ),

            trailing: IconButton(
              onPressed: (){
                context.read<TimeEntryProvider>().deleteTimeEntry(
                  timeEntry.id,
                );
              }, 
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
          Text("Tiempo total: ${timeEntry.totalTime}"),
          Text("Fecha: ${timeEntry.date.day}/${timeEntry.date.month}/${timeEntry.date.year}"),
          Text("Notas: ${timeEntry.notes}"),
        ],
      ),
    );
  }
}
