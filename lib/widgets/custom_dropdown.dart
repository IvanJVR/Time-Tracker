import 'package:flutter/material.dart';

final List<String> test = <String>[
  'Lunes',
  'Martes',
  'Miércoles',
  'Jueves',
  'Viernes',
  'Sábado',
  'Domingo',
];

class CustomDropdown extends StatefulWidget {
  //final List<String> nameList;

  const CustomDropdown({super.key});

  @override
  State<StatefulWidget> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      hintText: "Selecciona un proyecto",
      label: Text('Proyecto'),
      width: double.infinity,
      dropdownMenuEntries: [
        for (var day in test) DropdownMenuEntry(label: day, value: day),
      ],
    );
  }
}
