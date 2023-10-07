import 'package:flutter/material.dart';

class HuffmanTable extends StatelessWidget {
  final Map<String, String> dict;

  const HuffmanTable({Key? key, required this.dict}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      sortColumnIndex: 1,
      columns: const [
        DataColumn(label: Text('Character')),
        DataColumn(label: Text('Code')),
      ],
      rows: dict.entries
          .map(
            (e) => DataRow(cells: <DataCell>[
              DataCell(Text(e.key)),
              DataCell(Text(e.value)),
            ]),
          )
          .toList(),
    );
  }
}
