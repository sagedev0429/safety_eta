import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../masters/regions/regions.dart';
import '../model/sidebar_item.dart';

class SideBarRepsitory {
  static List<SidebarItemModel> mainItems = <SidebarItemModel>[
    SidebarItemModel(
      iconData: PhosphorIcons.command,
      color: Colors.purple,
      label: 'Dashboard',
    ),
    SidebarItemModel(
      iconData: PhosphorIcons.circlesThreePlus,
      color: Colors.pink,
      label: 'Observations',
    ),
  ];

  static List<SidebarItemModel> administrationItems = <SidebarItemModel>[
    SidebarItemModel(
      iconData: PhosphorIcons.buildings,
      color: Colors.purple,
      label: 'Sites',
    ),
    SidebarItemModel(
      iconData: PhosphorIcons.infinity,
      color: Colors.greenAccent[700]!,
      label: 'Companies',
    ),
    SidebarItemModel(
      iconData: PhosphorIcons.notePencil,
      color: Colors.yellow[600]!,
      label: 'Projects',
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
        ),
        SidebarItemModel(
          iconData: PhosphorIcons.plusMinus,
          color: Colors.teal,
          label: 'Audits ',
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
              body: Regions()),
          SidebarItemModel(
            iconData: PhosphorIcons.bellRinging,
            color: Colors.redAccent,
            label: 'Priority Levels',
          ),
          SidebarItemModel(
            iconData: PhosphorIcons.circlesFour,
            color: Colors.blueAccent,
            label: 'Observation Types',
          ),
          SidebarItemModel(
            iconData: PhosphorIcons.circlesThree,
            color: Colors.redAccent,
            label: 'Awareness Obs Categories',
          ),
          SidebarItemModel(
            iconData: PhosphorIcons.checkSquareOffset,
            color: Colors.blueAccent,
            label: 'Awareness Categories',
          ),
        ]),
    SidebarItemModel(
      iconData: PhosphorIcons.usersThree,
      color: Colors.blueAccent,
      label: 'Users',
    ),
  ];
}
