import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/task_model.dart';
import 'package:time_tracker/provider/task_provider.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<StatefulWidget> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController taskNameController = TextEditingController();

  @override
  void dispose() {
    taskNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: FractionallySizedBox(
          widthFactor: 0.95,
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Añadir tarea nueva',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  TextField(
                    controller: taskNameController,
                    decoration: InputDecoration(
                      hintText: "Ingresa el nombre de la tarea",
                      labelText: "Tarea",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        //Añadir funcionalidad
                        context.read<TaskProvider>().addTask(
                          Task(
                            id: DateTime.now().millisecondsSinceEpoch
                                .toString(),
                            name: taskNameController.text.trim(),
                          ),
                        );

                        Navigator.pop(context);
                      },
                      child: const Text('Guardar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
