import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '/data/model/entity.dart';
import '../../../theme/view/widgets/sidebar/sidebar_style.dart';

class Crud extends StatefulWidget {
  const Crud({
    super.key,
    this.entities = const [],
    required this.description,
  });
  final List<Entity> entities;
  final String description;

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  List<DataColumn> _buildColumns() {
    if (widget.entities.isNotEmpty) {
      return [
        ...widget.entities[0]
            .tableItemsToMap()
            .keys
            .map(
              (key) => DataColumn(
                label: Expanded(
                  child: Text(
                    key,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ),
            )
            .toList(),
        const DataColumn(
          label: Expanded(
            child: Text(
              'Action',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        )
      ];
    }
    return [];
  }

  List<DataRow> _buildRows() {
    return widget.entities
        .map(
          (entity) => DataRow(
            color: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (entity.tableItemsToMap().containsKey('Active') &&
                  !entity.tableItemsToMap()['Active']) {
                return const Color(0xffe6e7e8);
              }
              return null; // Use the default value.
            }),
            cells: [
              ...entity
                  .tableItemsToMap()
                  .values
                  .map((value) => DataCell(_buildCell(value)))
                  .toList(),
              DataCell(
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      PhosphorIcons.caretDoubleRightLight,
                      size: 22,
                      color: Colors.blue,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
        .toList();
  }

  Widget _buildCell(dynamic data) {
    if (data is bool) {
      return Text(
        data ? 'Yes' : 'No',
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xff1f2937),
          fontWeight: FontWeight.w400,
          // fontFamily: 'OpenSans',
        ),
      );
    } else if (data is Color) {
      return Container(
        width: double.infinity,
        height: 25,
        decoration: BoxDecoration(color: data),
      );
    }
    return Text(
      data.toString(),
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xff1f2937),
        fontWeight: FontWeight.w400,
        // fontFamily: 'OpenSans',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 5 / 6,
      padding: const EdgeInsets.all(10),
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
                    child: Text(
                      widget.description,
                      style: const TextStyle(
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
                    child: widget.entities.isNotEmpty
                        ? DataTable(
                            columns: _buildColumns(),
                            rows: _buildRows(),
                          )
                        : Container(),
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
            ),
          )
        ],
      ),
    );
  }
}
