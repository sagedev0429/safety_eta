import 'package:flutter/material.dart';

class SidebarItemModel {
  final IconData iconData;
  final Color color;
  final String label;
  final List<SidebarItemModel> subItems;
  final Widget body;
  SidebarItemModel({
    required this.iconData,
    required this.color,
    required this.label,
    this.subItems = const <SidebarItemModel>[],
    this.body = const Placeholder(),
  });
}
