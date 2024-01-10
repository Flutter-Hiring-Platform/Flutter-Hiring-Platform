import "package:flutter/material.dart";
import "job.dart";

class JobCell extends StatefulWidget {
  const JobCell({super.key, required this.job});

  final Job job;

  @override
  State<JobCell> createState() => _JobCellState();
}

class _JobCellState extends State<JobCell> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Job Title',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Location',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),

      ],
      rows: <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text(widget.job.title,
                style: TextStyle(color: Colors.blueGrey))),
            DataCell(Text(widget.job.company,
                style: TextStyle(color: Colors.blueGrey))),
          ],
        ),

      ],
    );
  }
}
