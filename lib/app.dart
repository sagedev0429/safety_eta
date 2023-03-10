import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'bloc/theme_bloc.dart';
import 'model/sidebar_item.dart';

double sidebarWidth = 350;
double shrinkSidebarWidth = 110;
double sidebarItemHeight = 50;
Color sidebarColor = const Color(0xff252b36);

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<SideBarItemModel> mainItems = <SideBarItemModel>[
    SideBarItemModel(
      iconData: PhosphorIcons.command,
      color: Colors.purple,
      label: 'Dashboard',
    ),
    SideBarItemModel(
      iconData: PhosphorIcons.circlesThreePlus,
      color: Colors.pink,
      label: 'Observations',
    ),
  ];

  List<SideBarItemModel> administrationItems = <SideBarItemModel>[
    SideBarItemModel(
      iconData: PhosphorIcons.buildings,
      color: Colors.purple,
      label: 'Sites',
    ),
    SideBarItemModel(
      iconData: PhosphorIcons.infinity,
      color: Colors.greenAccent[700]!,
      label: 'Companies',
    ),
    SideBarItemModel(
      iconData: PhosphorIcons.notePencil,
      color: Colors.yellow[600]!,
      label: 'Projects',
    ),
    SideBarItemModel(
      iconData: PhosphorIcons.plusMinus,
      color: Colors.teal,
      label: 'Audits',
      subItems: <SideBarItemModel>[
        SideBarItemModel(
          iconData: PhosphorIcons.clipboardText,
          color: Colors.teal,
          label: 'Templates',
        ),
        SideBarItemModel(
          iconData: PhosphorIcons.plusMinus,
          color: Colors.teal,
          label: 'Audits ',
        ),
      ],
    ),
    SideBarItemModel(
        iconData: PhosphorIcons.aperture,
        color: Colors.teal,
        label: 'Masters',
        subItems: [
          SideBarItemModel(
            iconData: PhosphorIcons.globeHemisphereWest,
            color: Colors.teal,
            label: 'Regions',
          ),
          SideBarItemModel(
            iconData: PhosphorIcons.bellRinging,
            color: Colors.redAccent,
            label: 'Priority Levels',
          ),
          SideBarItemModel(
            iconData: PhosphorIcons.circlesFour,
            color: Colors.blueAccent,
            label: 'Observation Types',
          ),
          SideBarItemModel(
            iconData: PhosphorIcons.circlesThree,
            color: Colors.redAccent,
            label: 'Awareness Obs Categories',
          ),
          SideBarItemModel(
            iconData: PhosphorIcons.checkSquareOffset,
            color: Colors.blueAccent,
            label: 'Awareness Categories',
          ),
        ]),
    SideBarItemModel(
      iconData: PhosphorIcons.usersThree,
      color: Colors.blueAccent,
      label: 'Users',
    ),
  ];

  List<Widget> _buildSidebarItems(
    List<SideBarItemModel> items,
    String selectedItemName,
    bool isSidebarExtended,
  ) {
    List<Widget> subItemWidgets = [];
    for (int i = 0; i < items.length; i++) {
      subItemWidgets.add(
        SidebarItem(
          iconData: items[i].iconData,
          label: items[i].label,
          color: items[i].color,
          selectedItemName: context.read<ThemeBloc>().state.selectedItemName,
          isSidebarExtended: isSidebarExtended,
          subItems: items[i].subItems,
          onTap: () {
            context.read<ThemeBloc>().add(
                  ThemeSidebarSelected(
                    selectedItemName: items[i].label,
                  ),
                );
          },
        ),
      );
    }
    return subItemWidgets;
  }

  Widget _buildCriteria(bool isSidebarExtended, String label) {
    return isSidebarExtended
        ? Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 10,
              bottom: 10,
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xff92959a),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        : const Icon(
            PhosphorIcons.dotsThree,
            size: 30,
            color: Colors.white,
          );
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
                // color: sidebarColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: state.isSidebarExtended
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        _buildLogo(state),
                        SizedBox(
                          height: 50,
                          child:
                              _buildCriteria(state.isSidebarExtended, 'MAIN'),
                        ),
                        ..._buildSidebarItems(
                          mainItems,
                          state.selectedItemName,
                          state.isSidebarExtended,
                        ),
                        SizedBox(
                          height: 50,
                          child: _buildCriteria(
                              state.isSidebarExtended, 'ADMINISTRATION'),
                        ),
                        ..._buildSidebarItems(
                          administrationItems,
                          state.selectedItemName,
                          state.isSidebarExtended,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              _buildBody(state),
              const CollapseButton(),
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
        // color: sidebarColor,
        decoration: BoxDecoration(
          color: sidebarColor,
        ),
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          right: 20,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 50,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  color: sidebarColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.selectedItemName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        // fontFamily: 'Aclonica',
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        PhosphorIcons.user,
                        color: sidebarColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildLogo(ThemeState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/safety_icon.png'),
          state.isSidebarExtended
              ? const SizedBox(
                  width: 10,
                )
              : Container(),
          state.isSidebarExtended
              ? Text(
                  'Safety ETA',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

class CollapseButton extends StatefulWidget {
  const CollapseButton({
    super.key,
  });

  @override
  State<CollapseButton> createState() => _CollapseButtonState();
}

class _CollapseButtonState extends State<CollapseButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return AnimatedPositioned(
          left: state.isSidebarExtended ? sidebarWidth - 20 : 90,
          top: 80,
          duration: const Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
          child: GestureDetector(
            onTap: () {
              if (state.isSidebarExtended) {
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
                color: Colors.white,
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
                  PhosphorIcons.arrowsLeftRight,
                  size: 25,
                  color: sidebarColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SidebarItem extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final String label;
  final String selectedItemName;
  final Color color;
  final bool isSidebarExtended;
  final List<SideBarItemModel> subItems;
  final bool isSubItem;
  const SidebarItem({
    Key? key,
    required this.iconData,
    required this.label,
    required this.selectedItemName,
    required this.onTap,
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

    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds:
            context.read<ThemeBloc>().state.isSidebarExtended ? 200 : 100,
      ),
    );

    anim = Tween(
            begin: context.read<ThemeBloc>().state.isSidebarExtended
                ? sidebarWidth
                : shrinkSidebarWidth,
            end: 20.0)
        .animate(animationController);

    color = ColorTween(
      end: widget.color,
      begin: Colors.white,
    ).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(covariant SidebarItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedItemName != widget.label) {
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
        if (widget.label != state.selectedItemName &&
            !widget.subItems
                .map(
                  (subItem) => subItem.label,
                )
                .contains(
                  state.selectedItemName,
                )) {
          setState(() {
            isSidebarItemExtended = false;
          });
        }

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
                            left: 40.0,
                          ),
                          child: Text(
                            widget.label,
                            style: const TextStyle(
                                color: Color(0xff92959a),
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
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
            selectedItemName: state.selectedItemName,
            onTap: () {
              context.read<ThemeBloc>().add(
                    ThemeSidebarSelected(
                      selectedItemName: subItem.label,
                    ),
                  );
            },
            color: subItem.color,
            isSidebarExtended: state.isSidebarExtended,
            isSubItem: true,
          ),
        )
        .toList();
  }

  Widget _buildExtendIcon() {
    return context.read<ThemeBloc>().state.isSidebarExtended &&
            widget.subItems.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              isSidebarItemExtended
                  ? Icons.keyboard_arrow_down
                  : Icons.keyboard_arrow_right,
              color: isHover ? widget.color : color.value,
              size: 28,
            ),
          )
        : Container();
  }

  Widget _buildItemBody(ThemeState state) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
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
            left: widget.isSubItem && state.isSidebarExtended ? 30 : 0,
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
              SizedBox(
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
                        children: [
                          Icon(
                            widget.iconData,
                            color: color.value == Colors.white
                                ? isHover
                                    ? Colors.white
                                    : widget.color.withOpacity(0.9)
                                : widget.color,
                            size: 30,
                          ),
                          widget.isSidebarExtended || widget.isSubItem
                              ? const SizedBox(
                                  width: 10,
                                )
                              : Container(),
                          widget.isSidebarExtended || widget.isSubItem
                              ? Text(
                                  widget.label,
                                  style: TextStyle(
                                    color: isHover ? widget.color : color.value,
                                    fontSize: 18,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      _buildExtendIcon()
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

    paint.color = Colors.white;
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
