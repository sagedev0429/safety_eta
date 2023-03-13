import 'package:flutter/material.dart';

import 'view/widgets/sidebar/sidebar.dart';

class Layout extends StatelessWidget {
  const Layout({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Sidebar(
      body: body,
    );
  }
}
