import 'package:animated_sidebar/features/theme/view/widgets/topbar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import 'view/widgets/sidebar/sidebar.dart';
import 'view/widgets/sidebar/sidebar_style.dart';

class Layout extends StatefulWidget {
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
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  late ScrollController _scrollController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _scrollController = ScrollController();
    scaffoldKey.currentState?.openDrawer();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      drawerEnableOpenDragGesture: false,
      drawerScrimColor: Colors.transparent,
      drawer: MediaQuery.of(context).size.width < 1000
          ? Drawer(
              width: sidebarWidth,
              backgroundColor: sidebarColor,
              child: Sidebar(
                selectedItemName: widget.selectedItemName,
                title: widget.title,
              ),
            )
          : null,
      body: WebSmoothScroll(
        controller: _scrollController,
        scrollOffset: 100,
        animationDuration: 600,
        curve: Curves.easeInOutCirc,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _scrollController,
          child: Column(
            children: [
              const Topbar(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MediaQuery.of(context).size.width < 1000
                        ? null
                        : Sidebar(
                            selectedItemName: widget.selectedItemName,
                            title: widget.title,
                          ),
                  ),
                  Expanded(
                    child: widget.body,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
