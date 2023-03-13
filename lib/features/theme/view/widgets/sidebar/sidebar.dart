import 'package:animated_sidebar/features/theme/data/repository/sidebar_repository.dart';
import 'package:animated_sidebar/features/theme/view/widgets/sidebar/sidebar_widgets/criteria.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/theme_bloc.dart';
import '../../../data/model/model.dart';
import '../topbar.dart';
import 'sidebar_style.dart';
import 'sidebar_widgets/collapse_button.dart';
import 'sidebar_widgets/logo.dart';
import 'sidebar_widgets/sidebar_item.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({
    super.key,
    required this.body,
  });
  final Widget body;

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
          selectedItemName: context.read<ThemeBloc>().state.selectedItemName,
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
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: sidebarColor,
                ),
                height: MediaQuery.of(context).size.height,
                width:
                    state.isSidebarExtended ? sidebarWidth : shrinkSidebarWidth,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: state.isSidebarExtended
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        Logo(state: state),
                        SizedBox(
                          height: 50,
                          child: Criteria(
                            isSidebarExtended: state.isSidebarExtended,
                            label: 'MAIN',
                          ),
                        ),
                        ..._buildSidebarItems(
                          SidebarRepsitory.mainItems,
                          state.selectedItemName,
                          state.isSidebarExtended,
                        ),
                        SizedBox(
                          height: 50,
                          child: Criteria(
                            isSidebarExtended: state.isSidebarExtended,
                            label: 'ADMINISTRATION',
                          ),
                        ),
                        ..._buildSidebarItems(
                          SidebarRepsitory.administrationItems,
                          state.selectedItemName,
                          state.isSidebarExtended,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              _buildBody(state),
              CollapseButton(
                isSidebarExtended: state.isSidebarExtended,
              ),
            ],
          ),
        );
      },
    );
  }

  AnimatedPositioned _buildBody(ThemeState state) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      child: Container(
        margin: EdgeInsets.only(
          left: state.isSidebarExtended ? sidebarWidth : shrinkSidebarWidth,
        ),
        decoration: BoxDecoration(
          color: sidebarColor,
        ),
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          right: 20,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          child: Column(
            children: [
              Topbar(
                title: state.selectedItemName,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                // child: [
                //   ...SideBarRepsitory.mainItems,
                //   ...SideBarRepsitory.administrationItems
                // ]
                //     .firstWhere((sidebarItem) =>
                //         sidebarItem.label == state.selectedItemName)
                //     .body,
                child: widget.body,
              )
            ],
          ),
        ),
      ),
    );
  }
}
