import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/theme_bloc.dart';
import '../../../data/model/model.dart';

import '../../../data/repository/repository.dart';
import 'sidebar_style.dart';
import 'sidebar_widgets/collapse_button.dart';

import 'sidebar_widgets/criteria.dart';
import 'sidebar_widgets/header.dart';
import 'sidebar_widgets/sidebar_item.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({
    super.key,
    required this.selectedItemName,
    required this.title,
  });

  final String selectedItemName;
  final String title;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  List<Widget> _buildSidebarItems(
    List<SidebarItemModel> items,
    String selectedItemName,
    bool isSidebarExtended,
  ) {
    List<Widget> subItemWidgets = [];
    for (int i = 0; i < items.length; i++) {
      subItemWidgets.add(
        SidebarItem(
          iconData: items[i].iconData,
          label: items[i].label,
          path: items[i].path,
          color: items[i].color,
          selectedItemName: selectedItemName,
          isSidebarExtended: isSidebarExtended,
          subItems: items[i].subItems,
        ),
      );
    }
    return subItemWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (ctx, state) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: sidebarColor,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              width:
                  state.isSidebarExtended ? sidebarWidth : shrinkSidebarWidth,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: state.isSidebarExtended
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    Header(
                      isSidebarExtended: state.isSidebarExtended,
                      userName: 'Carl Kent',
                    ),
                    Divider(
                      color: backgroundColor,
                      thickness: 0.5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      child: Criteria(
                        isSidebarExtended: state.isSidebarExtended,
                        label: 'MAIN',
                      ),
                    ),
                    ..._buildSidebarItems(
                      SidebarRepsitory.mainItems,
                      widget.selectedItemName,
                      state.isSidebarExtended,
                    ),
                    Divider(
                      color: backgroundColor,
                      thickness: 0.5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      child: Criteria(
                        isSidebarExtended: state.isSidebarExtended,
                        label: 'ADMINISTRATION',
                      ),
                    ),
                    ..._buildSidebarItems(
                      SidebarRepsitory.administrationItems,
                      widget.selectedItemName,
                      state.isSidebarExtended,
                    ),
                    Divider(
                      color: backgroundColor,
                      thickness: 0.5,
                    ),
                    ..._buildSidebarItems(
                      SidebarRepsitory.profileItems,
                      widget.selectedItemName,
                      state.isSidebarExtended,
                    )
                  ],
                ),
              ),
            ),
            // _buildBody(state),
            CollapseButton(
              isSidebarExtended: state.isSidebarExtended,
            ),
          ],
        );
      },
    );
  }

  // AnimatedPositioned _buildBody(ThemeState state) {
  //   return AnimatedPositioned(
  //     duration: const Duration(milliseconds: 200),
  //     child: Container(
  //       margin: EdgeInsets.only(
  //         left: state.isSidebarExtended ? sidebarWidth : shrinkSidebarWidth,
  //       ),
  //       decoration: BoxDecoration(
  //         color: sidebarColor,
  //       ),
  //       child: Container(
  //         decoration: BoxDecoration(
  //           color: backgroundColor,
  //         ),
  //         child: Column(
  //           children: [
  //             Container(
  //               padding: const EdgeInsets.all(15),
  //               child: widget.body,
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
