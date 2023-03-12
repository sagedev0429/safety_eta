import 'package:animated_sidebar/features/theme/view/widgets/sidebar/sidebar_style.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Topbar extends StatelessWidget {
  final String title;
  const Topbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 50,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: sidebarColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: backgroundColor,
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w800,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor,
            ),
            child: Icon(
              PhosphorIcons.user,
              color: sidebarColor,
            ),
          ),
        ],
      ),
    );
  }
}
