import 'package:animated_sidebar/features/theme/theme.dart';
import 'package:flutter/material.dart';

class Regions extends StatefulWidget {
  const Regions({super.key});

  @override
  State<Regions> createState() => _RegionsState();
}

class _RegionsState extends State<Regions> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Container(child: Text('Regions')),
    );
  }
}
