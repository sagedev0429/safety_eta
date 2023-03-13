import 'package:animated_sidebar/features/theme/view/widgets/sidebar/sidebar_style.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Regions extends StatefulWidget {
  const Regions({super.key});

  @override
  State<Regions> createState() => _RegionsState();
}

class _RegionsState extends State<Regions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 3 / 4,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Flexible(
            flex: 5,
            child: Container(
              width: double.infinity,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      'The following regions are available to create sites in',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: sidebarColor,
                        ),
                      ),
                    ),
                    child: DataTable(columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Region Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Time Zones Associated',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Active',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'OpenSans'),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'OpenSans'),
                          ),
                        ),
                      ),
                    ], rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('North America')),
                          DataCell(Text('EST. CST and PST')),
                          DataCell(Text('Yes')),
                          DataCell(
                            Icon(
                              PhosphorIcons.caretDoubleRightLight,
                              size: 22,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Asia')),
                          DataCell(Text(
                              'Japan Standard Time, India Standard Time & Arabian Standard')),
                          DataCell(Text('Yes')),
                          DataCell(
                            Icon(
                              PhosphorIcons.caretDoubleRightLight,
                              size: 22,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                      DataRow(
                        color: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          return Color(0xffe6e7e8);
                        }),
                        cells: <DataCell>[
                          DataCell(Text('North America')),
                          DataCell(Text('EST. CST and PST')),
                          DataCell(Text('Yes')),
                          DataCell(
                            Icon(
                              PhosphorIcons.caretDoubleRightLight,
                              size: 22,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text('container'),
            ),
          )
        ],
      ),
    );
  }
}
