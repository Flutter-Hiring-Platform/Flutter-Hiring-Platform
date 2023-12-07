import "package:flutter/material.dart";
import "job.dart";
// convert option + enter

class JobCell extends StatefulWidget {
  const JobCell({super.key, required this.job});

  final Job job;
  // final int type;

  @override
  State<JobCell> createState() => _JobCellState();
}

class _JobCellState extends State<JobCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:40,
      // color: widget.type == 0 ? Colors.white : Colors.black12,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(widget.job.title,
            style: TextStyle(color: Colors.blueGrey )),
                // color: widget.job.completed ? Colors.blueGrey : Colors.deepPurple)),
               
        // if(!widget.job.completed)...[
        //   TextButton(onPressed: () {
        //     setState(() {
        //       widget.job.completed = true;
        //     });
        //   }, child: const Text("Mark")),
        // ]

      ]),
    );
  }
}
