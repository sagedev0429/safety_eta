import 'package:animated_sidebar/features/theme/view/widgets/sidebar/sidebar_style.dart';
import 'package:animated_sidebar/features/theme/view/widgets/topbar/topbar_widgets/logo.dart';
import 'package:animated_sidebar/features/theme/view/widgets/topbar/topbar_widgets/search_field.dart';
import 'package:flutter/material.dart';

class Topbar extends StatelessWidget {
  const Topbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: sidebarColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            const SearchField(),
          ],
        ),
      ),
    );
  }
}
