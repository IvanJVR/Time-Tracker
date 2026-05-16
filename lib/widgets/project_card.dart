import 'package:flutter/material.dart';
import 'package:time_tracker/models/project_model.dart';

class ProjectCard extends StatelessWidget{
  final Project project;
  final int index;

  const ProjectCard({
    super.key,
    required this.project,
    required this.index,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          '${index + 1}) ${project.name}',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}