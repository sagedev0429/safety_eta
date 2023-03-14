import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final String userName;
  final bool isSidebarExtended;
  const Header({
    super.key,
    required this.userName,
    required this.isSidebarExtended,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15,
      ),
      child: Text(
        widget.isSidebarExtended ? widget.userName : '',
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
