import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../bloc/theme_bloc.dart';
import '../sidebar_style.dart';

class CollapseButton extends StatefulWidget {
  const CollapseButton({
    super.key,
    required this.isSidebarExtended,
  });

  final bool isSidebarExtended;

  @override
  State<CollapseButton> createState() => _CollapseButtonState();
}

class _CollapseButtonState extends State<CollapseButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left:
          widget.isSidebarExtended ? sidebarWidth - 15 : shrinkSidebarWidth - 15,
      top: 80,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      child: GestureDetector(
        onTap: () {
          if (widget.isSidebarExtended) {
            context.read<ThemeBloc>().add(ThemeSidebarShrank());
          } else {
            context.read<ThemeBloc>().add(ThemeSidebarExtended());
          }
        },
        child: Container(
          padding: const EdgeInsets.only(
            top: 3,
            left: 5,
            right: 5,
            bottom: 7,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xfff1f4f9),
            boxShadow: [
              BoxShadow(
                color: sidebarColor,
                offset: const Offset(1, 1),
              )
            ],
          ),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Icon(
              PhosphorIcons.arrowsLeftRightLight,
              size: 18,
              weight: 400,
              color: sidebarColor,
            ),
          ),
        ),
      ),
    );
  }
}
