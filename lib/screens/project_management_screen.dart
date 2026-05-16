import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/provider/project_provider.dart';
import 'package:time_tracker/widgets/add_project_dialog.dart';
import 'package:time_tracker/widgets/empty_screen_widget.dart';
import 'package:time_tracker/widgets/project_card.dart';

class ProjectManagementScreen extends StatelessWidget {
  const ProjectManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Administrador de Projectos",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: const Color.fromRGBO(52, 192, 164, 1),
      ),
      body: Consumer<ProjectProvider>(
        builder: (context, provider, child) {
          final projects = provider.projects;
          if (projects.isEmpty) {
            return EmptyScreenWidget(screen: "projectos");
          }
          return ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return ProjectCard(project: projects[index], index: index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context){
              return const AddProjectDialog();
          });
        },
        child: Icon(Icons.add),
        tooltip: 'Add Project',
      ),
    );
  }
}
