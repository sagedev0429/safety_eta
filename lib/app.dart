import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'bloc/theme_bloc.dart';
import 'model/sidebar_item.dart';

double navbarWidth = 250;
double SidebarItemHeight = 100;
Color navbarColor = const Color.fromARGB(255, 75, 34, 240);
LinearGradient gradient1 = const LinearGradient(
  colors: [Color(0xff3bc2ff), Color(0x9fe6fadd)],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);

LinearGradient gradient2 = const LinearGradient(
  colors: [Color(0xff3bc2ff), Color(0xdfe6fadd)],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);

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
      iconData: PhosphorIcons.globeHemisphereWest,
      color: Colors.teal,
      label: 'Regions',
    ),
    SideBarItemModel(
      iconData: PhosphorIcons.buildings,
      color: Colors.purple,
      label: 'Sites',
    ),
    SideBarItemModel(
      iconData: PhosphorIcons.infinity,
      color: Colors.green,
      label: 'Companies',
    ),
    SideBarItemModel(
      iconData: PhosphorIcons.notePencil,
      color: Colors.yellow,
      label: 'Projects',
    ),
    SideBarItemModel(
        iconData: PhosphorIcons.plusMinus,
        color: Colors.teal,
        label: 'Audits',
        subItems: <SideBarItemModel>[
          SideBarItemModel(
            iconData: PhosphorIcons.clipboardText,
            color: Colors.black,
            label: 'Templates',
          ),
          SideBarItemModel(
            iconData: PhosphorIcons.clipboardText,
            color: Colors.white,
            label: 'Templates',
          )
        ]),
    SideBarItemModel(
      iconData: PhosphorIcons.usersThree,
      color: Colors.blueAccent,
      label: 'Users',
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
  ];

  List<Widget> _builtMainItems(int selectedIndex, bool isSidebarExtended) {
    // print('build main');
    List<Widget> mainItemWidgets = [];
    for (int i = 0; i < mainItems.length; i++) {
      mainItemWidgets.add(
        SidebarItem(
          iconData: mainItems[i].iconData,
          label: mainItems[i].label,
          color: mainItems[i].color,
          index: i,
          selectedIndex: selectedIndex,
          isSidebarExtended: isSidebarExtended,
          onTap: () {
            context.read<ThemeBloc>().add(
                  ThemeSidebarSelected(
                    index: i,
                  ),
                );
          },
        ),
      );
    }
    return mainItemWidgets;
  }

  List<Widget> _builtAdministrationItems(
      int selectedIndex, bool isSidebarExtended) {
    List<Widget> administrationItemWidgets = [];
    for (int i = 0; i < administrationItems.length; i++) {
      administrationItemWidgets.add(
        SidebarItem(
          iconData: administrationItems[i].iconData,
          label: administrationItems[i].label,
          color: administrationItems[i].color,
          index: i + mainItems.length,
          selectedIndex: selectedIndex,
          isSidebarExtended: isSidebarExtended,
          onTap: () {
            context.read<ThemeBloc>().add(
                  ThemeSidebarSelected(
                    index: i + mainItems.length,
                  ),
                );
          },
        ),
      );
    }
    return administrationItemWidgets;
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
                  gradient: gradient1,
                ),
                height: MediaQuery.of(context).size.height,
                width: state.isSidebarExtended ? navbarWidth : 100,
                // color: navbarColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                          // left: (navbarWidth + SidebarItemHeight) / 8.0,
                          left: 30,
                          bottom: 50,
                        ),
                        child: Row(
                          children: [
                            Image.asset('images/safety_icon.png'),
                            state.isSidebarExtended
                                ? const SizedBox(
                                    width: 10,
                                  )
                                : Container(),
                            state.isSidebarExtended
                                ? const Text(
                                    'Safety ETA',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.orangeAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      ..._builtMainItems(
                        state.selectedIndex,
                        state.isSidebarExtended,
                      ),
                      ..._builtAdministrationItems(
                        state.selectedIndex,
                        state.isSidebarExtended,
                      )
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                child: Container(
                  // width: MediaQuery.of(context).size.width - navbarWidth,
                  margin: EdgeInsets.only(
                    left: state.isSidebarExtended ? navbarWidth : 100,
                  ),
                  // color: navbarColor,
                  decoration: BoxDecoration(
                    gradient: gradient2,
                  ),
                  padding:
                      const EdgeInsets.only(top: 20, bottom: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SidebarItemHeight / 4),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: gradient2,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                List<SideBarItemModel>.from([
                                  ...mainItems,
                                  ...administrationItems
                                ])[state.selectedIndex]
                                    .label,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Icon(
                                  PhosphorIcons.user,
                                  color: navbarColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const CollapseButton(),
            ],
          ),
        );
      },
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
          left: state.isSidebarExtended ? navbarWidth - 17 : 85,
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
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: navbarColor,
                    offset: const Offset(1, 1),
                  )
                ],
              ),
              child: AnimatedCrossFade(
                duration: const Duration(
                  milliseconds: 200,
                ),
                firstChild: Icon(
                  PhosphorIcons.caretDoubleLeft,
                  size: 20,
                  color: navbarColor,
                ),
                secondChild: Icon(
                  PhosphorIcons.caretDoubleRight,
                  size: 20,
                  color: navbarColor,
                ),
                crossFadeState: state.isSidebarExtended
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
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
  final int index;
  final Color color;
  final int selectedIndex;
  final bool isSidebarExtended;
  const SidebarItem({
    Key? key,
    required this.iconData,
    required this.label,
    required this.onTap,
    required this.color,
    required this.index,
    required this.selectedIndex,
    required this.isSidebarExtended,
  }) : super(key: key);

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;

  late Animation<double> anim1;
  late Animation<double> anim2;
  late Animation<double> anim3;
  late Animation<double> anim4;
  late Animation<Color?> color;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 275),
    );

    controller3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    anim1 = Tween(begin: navbarWidth, end: navbarWidth - SidebarItemHeight / 4)
        .animate(controller1);
    anim2 = Tween(begin: navbarWidth, end: SidebarItemHeight / 4)
        .animate(controller2);
    anim3 = Tween(begin: navbarWidth, end: SidebarItemHeight / 2)
        .animate(controller2);

    anim4 = Tween(begin: navbarWidth, end: 100.0).animate(controller3);
    color =
        ColorTween(end: widget.color, begin: Colors.white).animate(controller2);

    controller1.addListener(() {
      setState(() {});
    });

    controller2.addListener(() {
      setState(() {});
    });

    controller3.addListener(() {});
  }

  @override
  void didUpdateWidget(covariant SidebarItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedIndex != widget.index) {
      controller1.reverse();
      controller2.reverse();
    } else {
      controller1.forward();
      controller2.forward();
    }

    if (widget.isSidebarExtended) {
      controller3.forward();
    } else {
      controller3.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            CustomPaint(
              painter: CurvePainter(
                animValue3: anim1.value,
                animValue2: anim2.value,
                animValue1: anim3.value,
                animValue4: anim4.value,
              ),
            ),
            SizedBox(
              height: SidebarItemHeight * 3 / 4,
              width: navbarWidth,
              child: Container(
                padding: EdgeInsets.only(
                  left: navbarWidth / 8 + SidebarItemHeight / 8 - 5.0,
                  // right: navbarWidth / 4,
                  top: 25,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: color.value,
                      ),
                      child: ClipRRect(
                        child: Icon(
                          widget.iconData,
                          color: color.value == Colors.white
                              ? widget.color
                              : Colors.white,
                        ),
                      ),
                    ),
                    widget.isSidebarExtended
                        ? const SizedBox(
                            width: 10,
                          )
                        : Container(),
                    widget.isSidebarExtended
                        ? Text(
                            widget.label,
                            style: TextStyle(
                              color: color.value,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final double animValue1;
  final double animValue2;
  final double animValue3;
  final double animValue4;
  CurvePainter({
    required this.animValue1,
    required this.animValue2,
    required this.animValue3,
    required this.animValue4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    print(animValue4);
    Path path = Path();
    Paint paint = Paint();

    paint.color = Colors.white;
    path.moveTo(navbarWidth, 0);
    path.quadraticBezierTo(
        navbarWidth, SidebarItemHeight / 4, animValue3, SidebarItemHeight / 4);
    path.lineTo(animValue1, SidebarItemHeight / 4);
    path.quadraticBezierTo(
        animValue2, SidebarItemHeight / 4, animValue2, SidebarItemHeight / 2);
    path.lineTo(navbarWidth, SidebarItemHeight / 2);
    path.close();

    path.moveTo(navbarWidth, SidebarItemHeight);
    path.quadraticBezierTo(navbarWidth, SidebarItemHeight * 3 / 4, animValue3,
        SidebarItemHeight * 3 / 4);
    path.lineTo(animValue1, SidebarItemHeight * 3 / 4);
    path.quadraticBezierTo(animValue2, SidebarItemHeight * 3 / 4, animValue2,
        SidebarItemHeight / 2);
    path.lineTo(navbarWidth, SidebarItemHeight / 2);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate == this;
  }
}
