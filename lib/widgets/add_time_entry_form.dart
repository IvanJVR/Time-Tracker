import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/time_entry_model.dart';
import 'package:time_tracker/provider/project_provider.dart';
import 'package:time_tracker/provider/task_provider.dart';
import 'package:time_tracker/provider/time_entry_provider.dart';

final List<String> test = <String>[
  'Lunes',
  'Martes',
  'Miércoles',
  'Jueves',
  'Viernes',
  'Sábado',
  'Domingo',
];

class AddTimeEntryForm extends StatefulWidget {
  const AddTimeEntryForm({super.key});
  @override
  State<StatefulWidget> createState() => _AddTimeEntryFromState();
}

class _AddTimeEntryFromState extends State<AddTimeEntryForm> {
  final _formKey = GlobalKey<FormState>();

  String? projectId;
  String? taskId;
  String notes = "";
  double totalTime = 0;
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProjectDropdown(
            onSelected: (value){
              projectId = value;
            }
          ),

          SizedBox(height: 16),

          _TaskDropdown(
            onSelected: (value){
              taskId = value;
            },
          ),

          SizedBox(height: 16),

          TextFormField(
            decoration: InputDecoration(
              hintText: "Ingresa notas",
              labelText: "Notas",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            onChanged: (value){
              notes = value;
            },
          ),

          SizedBox(height: 16),

          _DatePicker(
            onDateSelected: (selected){
              date = selected;
            },
          ),

          SizedBox(height: 16),

          TextFormField(
            decoration: InputDecoration(
              hintText: "Ingrese las horas",
              labelText: "Horas",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            onChanged: (value){
              totalTime = double.tryParse(value) ?? 0;
            },
          ),

          SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {
              context.read<TimeEntryProvider>().addTimeEntry(
                TimeEntry(
                  id: DateTime.now().millisecondsSinceEpoch.toString(), 
                  projectId: projectId!, 
                  taskId: taskId!, 
                  totalTime: totalTime, 
                  date: date!, 
                  notes: notes)
              );

              Navigator.pop(context);
            }, child: Text("Guardar")),
          ),
        ],
      ),
    );
  }
}

class _ProjectDropdown extends StatelessWidget {
  final ValueChanged<String?> onSelected;

  const _ProjectDropdown({
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectProvider>(
      builder: (context, provider, child) {
        final projects = provider.projects;

        return DropdownMenu(
          hintText: "Selecciona un proyecto",
          label: Text('Proyectos'),
          width: double.infinity,
          onSelected: onSelected,
          dropdownMenuEntries: [
            for (var project in projects)
              DropdownMenuEntry(label: project.name, value: project.id),
          ],
        );
      },
    );
  }
}

class _TaskDropdown extends StatelessWidget {
  final ValueChanged<String?> onSelected;
  
  const _TaskDropdown({
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, provider, child) {
        final tasks = provider.tasks;

        if (tasks.isEmpty) {
          return const DropdownMenu(
            enabled: false,
            hintText: "No hay tareas disponibles",
            label: Text("Tareas"),
            width: double.infinity,
            dropdownMenuEntries: [],
          );
        }

        return DropdownMenu(
          hintText: "Selecciona una tarea",
          label: Text('Tareas'),
          width: double.infinity,
          onSelected: onSelected,
          dropdownMenuEntries: [
            for (var task in tasks)
              DropdownMenuEntry(label: task.name, value: task.id),
          ],
        );
      },
    );
  }
}

class _DatePicker extends StatefulWidget {
  final ValueChanged<DateTime?> onDateSelected;

  const _DatePicker({
    required this.onDateSelected,
  });

  @override
  State<StatefulWidget> createState() => _DatePickerState();
}

class _DatePickerState extends State<_DatePicker> {
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    );

    setState(() {
      selectedDate = pickedDate;
    });

    widget.onDateSelected(pickedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 20,
      children: <Widget>[
        Text(
          selectedDate != null
              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
              : 'No date selected',
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: _selectDate,
            child: const Text('Selecciona una fecha'),
          ),
        ),
      ],
    );
  }
}
