import 'package:animated_sidebar/features/administration/audits/templates/templates.dart';
import 'package:animated_sidebar/features/administration/masters/priority_levels/view/priority_levels.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../model/sidebar_item.dart';
import '../../../../features/features.dart';

class SidebarRepsitory {
  static List<SidebarItemModel> mainItems = <SidebarItemModel>[
    SidebarItemModel(
      iconData: PhosphorIcons.command,
      color: Colors.purple,
      label: 'Dashboard',
      path: 'dashboard',
      body: const Dashboard(),
    ),
    SidebarItemModel(
      iconData: PhosphorIcons.circlesThreePlus,
      color: Colors.pink,
      label: 'Observations',
      path: 'observations',
      body: const Observations(),
    ),
  ];

  static List<SidebarItemModel> administrationItems = <SidebarItemModel>[
    SidebarItemModel(
      iconData: PhosphorIcons.buildings,
      color: Colors.purple,
      label: 'Sites',
      path: 'sites',
      body: const Sites(),
    ),
    SidebarItemModel(
      iconData: PhosphorIcons.infinity,
      color: Colors.greenAccent[700]!,
      label: 'Companies',
      path: 'companies',
      body: const Companies(),
    ),
    SidebarItemModel(
      iconData: PhosphorIcons.notePencil,
      color: Colors.yellow[600]!,
      label: 'Projects',
      path: 'projects',
      body: const Projects(),
    ),
    SidebarItemModel(
      iconData: PhosphorIcons.plusMinus,
      color: Colors.teal,
      label: 'Audits',
      subItems: <SidebarItemModel>[
        SidebarItemModel(
          iconData: PhosphorIcons.clipboardText,
          color: Colors.teal,
          label: 'Templates',
          path: 'templates',
          body: const Templates(),
        ),
        SidebarItemModel(
          iconData: PhosphorIcons.plusMinus,
          color: Colors.teal,
          label: 'Audits ',
          path: 'audits',
          body: const Audits(),
        ),
      ],
    ),
    SidebarItemModel(
        iconData: PhosphorIcons.aperture,
        color: Colors.teal,
        label: 'Masters',
        subItems: [
          SidebarItemModel(
            iconData: PhosphorIcons.globeHemisphereWest,
            color: Colors.teal,
            label: 'Regions',
            path: 'regions',
            body: const Regions(),
          ),
          SidebarItemModel(
            iconData: PhosphorIcons.bellRinging,
            color: Colors.redAccent,
            label: 'Priority Levels',
            path: 'priority-levels',
            body: const PriorityLevels(),
          ),
          SidebarItemModel(
            iconData: PhosphorIcons.circlesFour,
            color: Colors.blueAccent,
            label: 'Observation Types',
            path: 'observation-types',
            body: const ObservationTypes(),
          ),
          SidebarItemModel(
            iconData: PhosphorIcons.circlesThree,
            color: Colors.redAccent,
            label: 'Awareness Obs Categories',
            path: 'awareness-obs-categories',
            body: const AwarenessObsCategories(),
          ),
          SidebarItemModel(
            iconData: PhosphorIcons.checkSquareOffset,
            color: Colors.blueAccent,
            label: 'Awareness Categories',
            path: 'awareness-categories',
            body: const AwarenessCategories(),
          ),
        ]),
    SidebarItemModel(
      iconData: PhosphorIcons.usersThree,
      color: Colors.blueAccent,
      label: 'Users',
      path: 'users',
      body: const Users(),
    ),
  ];

  static List<SidebarItemModel> getItems() {
    List<SidebarItemModel> items = List.from(mainItems);
    for (var item in administrationItems) {
      for (var i in item.subItems) {
        items.add(i);
      }
      if (item.subItems.isEmpty) {
        items.add(item);
      }
    }
    return items;
  }

  static String getPath(String label) {
    return [...mainItems, ...administrationItems]
        .firstWhere((element) => element.label == label)
        .path;
  }
}
