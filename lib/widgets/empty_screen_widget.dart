import 'package:flutter/material.dart';

class EmptyScreenWidget extends StatelessWidget{
  final String screen;

  const EmptyScreenWidget({
    super.key,
    required this.screen
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("No hay $screen"),
    );
  }
}