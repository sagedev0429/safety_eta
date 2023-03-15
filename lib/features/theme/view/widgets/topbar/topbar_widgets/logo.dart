import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/safety_icon.png'),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'Safety ETA',
          style: TextStyle(
            fontSize: 24,
            color: Colors.orangeAccent,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}
