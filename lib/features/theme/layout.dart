import 'package:flutter/material.dart';

import 'view/widgets/sidebar/sidebar.dart';

class Layout extends StatelessWidget {
  const Layout({
    super.key,
    required this.body,
    required this.selectedItemName,
    required this.title,
  });

  final Widget body;
  final String selectedItemName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Sidebar(
      selectedItemName: selectedItemName,
      title: title,
      body: body,
    );
  }
}
