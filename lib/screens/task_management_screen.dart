import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/provider/task_provider.dart';
import 'package:time_tracker/widgets/add_task_dialog.dart';
import 'package:time_tracker/widgets/empty_screen_widget.dart';
import 'package:time_tracker/widgets/task_card.dart';

class TaskManagementScreen extends StatelessWidget {
  const TaskManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Administrador de Tareas",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: const Color.fromRGBO(52, 192, 164, 1),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, provider, child) {
          final tasks = provider.tasks;
          if (tasks.isEmpty) {
            return EmptyScreenWidget(screen: "Tareas");
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TasktCard(task: tasks[index], index: index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context){
              return const AddTaskDialog();
          });
        },
        child: Icon(Icons.add),
        tooltip: 'Add Task',
      ),
    );
  }
}
