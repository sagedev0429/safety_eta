import 'package:animated_sidebar/features/theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.state,
  });
  final ThemeState state;

  @override
  Widget build(BuildContext context) {
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
              ? const Text(
                  'Safety ETA',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
