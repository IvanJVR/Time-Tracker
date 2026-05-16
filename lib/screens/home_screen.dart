import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/provider/time_entry_provider.dart';
import 'package:time_tracker/screens/add_time_entry_screen.dart';
import 'package:time_tracker/screens/project_management_screen.dart';
import 'package:time_tracker/screens/task_management_screen.dart';
import 'package:time_tracker/widgets/empty_screen_widget.dart';
import 'package:time_tracker/widgets/time_entry_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF67BE9B),
        title: Text(
          'Time Entries',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            );
          },
        ),
      ),
      //Menú para mostrar opciones
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: const Color(0xFF67BE9B),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                //Título del menú
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Menú", style: Theme.of(context).textTheme.labelLarge),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
            ),
            //Elementos del menú
            ListTile(
              title: Text(
                "Administrador de Proyectos",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectManagementScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                "Administrador de Tareas",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskManagementScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      //Cuerpo de las entradas
      body: Consumer<TimeEntryProvider>(
        builder: (context, provider, child) {
          final entries = provider.entries;
          if (entries.isEmpty) {
            return EmptyScreenWidget(screen: "entradas");
          }
          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              return TimeEntryCard(timeEntry: provider.entries[index]);
            },
          );
        },
      ),

      //Botón de añadir entrada
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFF1DB42),
        onPressed: () {
          //

          // Navigate to the screen to add a new time entry
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTimeEntryScreen()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Add Time Entry',
      ),
    );
  }
}
