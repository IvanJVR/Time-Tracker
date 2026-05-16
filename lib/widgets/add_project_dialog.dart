import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/project_model.dart';
import 'package:time_tracker/provider/project_provider.dart';

class AddProjectDialog extends StatefulWidget {
  const AddProjectDialog({super.key});

  @override
  State<StatefulWidget> createState() => _AddProjectDialogState();
}

class _AddProjectDialogState extends State<AddProjectDialog> {
  final TextEditingController projectNameController = TextEditingController();

  @override
  void dispose() {
    projectNameController.dispose();
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
                        'Añadir proyecto nuevo',
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

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Nombre del proyecto"),
                  ),

                  const SizedBox(height: 8),

                  TextField(
                    controller: projectNameController,
                    decoration: InputDecoration(
                      hintText: "Ingresa el nombre del proyecto",
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
                        context.read<ProjectProvider>().addProject(
                          Project(
                            id: DateTime.now().millisecondsSinceEpoch
                                .toString(),
                            name: projectNameController.text.trim(),
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
