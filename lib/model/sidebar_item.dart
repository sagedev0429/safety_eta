import 'package:flutter/material.dart';

class SideBarItemModel {
  final IconData iconData;
  final Color color;
  final String label;
  final List<SideBarItemModel> subItems;
  SideBarItemModel({
    required this.iconData,
    required this.color,
    required this.label,
    this.subItems = const <SideBarItemModel>[],
  });
}
