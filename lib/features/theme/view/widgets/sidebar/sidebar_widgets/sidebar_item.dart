import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../bloc/theme_bloc.dart';
import '../../../../data/model/model.dart';
import '../sidebar_style.dart';

class SidebarItem extends StatefulWidget {
  final IconData iconData;
  final String label;
  final String path;
  final String selectedItemName;
  final Color color;
  final bool isSidebarExtended;
  final List<SidebarItemModel> subItems;
  final bool isSubItem;
  const SidebarItem({
    Key? key,
    required this.iconData,
    required this.label,
    required this.path,
    required this.selectedItemName,
    required this.color,
    required this.isSidebarExtended,
    this.subItems = const [],
    this.isSubItem = false,
  }) : super(key: key);

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> anim;
  late Animation<Color?> color;
  bool isHover = false;
  bool isSidebarItemExtended = false;
  CustomPopupMenuController customPopupMenuController =
      CustomPopupMenuController();

  @override
  void initState() {
    super.initState();

    setState(() {
      isSidebarItemExtended = widget.subItems.map((e) => e.path).contains(
            widget.selectedItemName,
          );
    });
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds:
            context.read<ThemeBloc>().state.isSidebarExtended ? 300 : 100,
      ),
    );

    anim = Tween(
      begin: context.read<ThemeBloc>().state.isSidebarExtended
          ? sidebarWidth
          : shrinkSidebarWidth,
      end: 20.0,
    ).animate(animationController);

    color = ColorTween(
      end: widget.color,
      begin: backgroundColor,
    ).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });
    if (widget.selectedItemName != widget.path) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant SidebarItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedItemName != widget.path) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  void _showPopupMenu(ThemeState state) {
    if (widget.subItems.isNotEmpty && !state.isSidebarExtended) {
      customPopupMenuController.showMenu();
    }
  }

  void _hidePopupMenu(ThemeState state) {
    if (widget.subItems.isNotEmpty && !state.isSidebarExtended) {
      customPopupMenuController.hideMenu();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeBloc, ThemeState>(
      listener: (context, state) {
        animationController.duration = Duration(
            milliseconds:
                context.read<ThemeBloc>().state.isSidebarExtended ? 200 : 100);
        anim = Tween(
                begin: context.read<ThemeBloc>().state.isSidebarExtended
                    ? sidebarWidth
                    : shrinkSidebarWidth,
                end: sidebarItemHeight / 4)
            .animate(animationController);

        if (state.hoveredItemName != widget.label) {
          _hidePopupMenu(state);
        }
      },
      builder: (context, state) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) {
            setState(() {
              isHover = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHover = false;
            });
          },
          child: Column(
            children: [
              CustomPopupMenu(
                controller: customPopupMenuController,
                menuBuilder: () => MouseRegion(
                  onExit: (event) {
                    _hidePopupMenu(state);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: sidebarColor,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                          ),
                          child: Text(
                            widget.label,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ..._buildSubItemsMenu(),
                      ],
                    ),
                  ),
                ),
                barrierColor: Colors.transparent,
                pressType: PressType.longPress,
                showArrow: false,
                horizontalMargin: shrinkSidebarWidth + 5,
                verticalMargin: -sidebarItemHeight + 20,
                child: _buildItemBody(state),
              ),
              ...(state.isSidebarExtended && isSidebarItemExtended
                  ? _buildSubItemsMenu()
                  : []),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildSubItemsMenu() {
    final state = context.read<ThemeBloc>().state;

    return widget.subItems
        .map(
          (subItem) => SidebarItem(
            iconData: subItem.iconData,
            label: subItem.label,
            path: subItem.path,
            selectedItemName: widget.selectedItemName,
            color: subItem.color,
            isSidebarExtended: state.isSidebarExtended,
            isSubItem: true,
          ),
        )
        .toList();
  }

  Widget _buildExtendIcon(ThemeState state) {
    return state.isSidebarExtended && widget.subItems.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              isSidebarItemExtended
                  ? Icons.keyboard_arrow_down
                  : Icons.keyboard_arrow_right,
              color: isSidebarItemExtended ? widget.color : backgroundColor,
              size: 28,
            ),
          )
        : Container();
  }

  Widget _buildItemBody(ThemeState state) {
    return GestureDetector(
      onTap: () {
        if (widget.path.isNotEmpty) {
          GoRouter.of(context).go('/${widget.path}');
        }

        setState(() {
          isSidebarItemExtended = !isSidebarItemExtended;
        });
      },
      child: MouseRegion(
        onEnter: (event) {
          if (!widget.isSubItem) {
            context.read<ThemeBloc>().add(
                  ThemeSidebarHovered(hoveredItemName: widget.label),
                );
            _showPopupMenu(state);
          }
        },
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(
            left: widget.isSubItem && state.isSidebarExtended ? 15 : 0,
          ),
          child: Stack(
            children: [
              state.isSidebarExtended
                  ? CustomPaint(
                      painter: CurvePainter(
                        animValue: anim.value,
                        width: sidebarWidth,
                      ),
                    )
                  : widget.isSubItem
                      ? SizedBox(
                          width: sidebarWidth,
                        )
                      : CustomPaint(
                          painter: CurvePainter(
                            animValue: anim.value,
                            width: shrinkSidebarWidth,
                          ),
                        ),
              Container(
                color: isHover && widget.selectedItemName != widget.path
                    ? const Color(0xff3b414a)
                    : Colors.transparent,
                height: sidebarItemHeight,
                width: sidebarWidth,
                child: Container(
                  padding: EdgeInsets.only(
                    left: sidebarWidth / 8 + sidebarItemHeight / 8 - 5.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Icon(
                              widget.iconData,
                              color: widget.color,
                              size: 22,
                            ),
                          ),
                          widget.isSidebarExtended || widget.isSubItem
                              ? const SizedBox(
                                  width: 10,
                                )
                              : Container(),
                          widget.isSidebarExtended || widget.isSubItem
                              ? Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    widget.label,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color:
                                          widget.selectedItemName == widget.path
                                              ? widget.color
                                              : Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      _buildExtendIcon(state)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final double animValue;
  final double width;
  CurvePainter({
    required this.animValue,
    required this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    paint.color = backgroundColor;
    path.addRect(
      Rect.fromPoints(
        Offset(animValue, 0),
        Offset(
          width,
          sidebarItemHeight,
        ),
      ),
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate == this;
  }
}
