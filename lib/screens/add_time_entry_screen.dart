import 'package:flutter/material.dart';
import 'package:time_tracker/widgets/add_time_entry_form.dart';

class AddTimeEntryScreen extends StatefulWidget {
  const AddTimeEntryScreen({super.key});

  @override
  _AddTimeEntryScreenState createState() => _AddTimeEntryScreenState();
}

class _AddTimeEntryScreenState extends State<AddTimeEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Time Entry",
          style: Theme.of(context).textTheme.titleLarge,

        ),
        backgroundColor: const Color.fromRGBO(52, 192, 164, 1),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20.0),
        child: AddTimeEntryForm(),
      )
    );
  }
}
