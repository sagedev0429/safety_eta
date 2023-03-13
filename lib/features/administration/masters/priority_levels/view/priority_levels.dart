import 'package:animated_sidebar/features/administration/masters/widgets/crud.dart';
import 'package:flutter/material.dart';

class PriorityLevels extends StatefulWidget {
  const PriorityLevels({super.key});

  @override
  State<PriorityLevels> createState() => _PriorityLevelsState();
}

class _PriorityLevelsState extends State<PriorityLevels> {
  @override
  Widget build(BuildContext context) {
    return Crud(
      description:
          'List of defined Priority Levels. Types can be added or current ones edited from this screen.',
    );
  }
}
