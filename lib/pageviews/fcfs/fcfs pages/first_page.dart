import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/help_in_responsive_widgets.dart';

class FCFSPageViewFirstPage extends StatefulWidget {
  int pageNumber = 0;
  FCFSPageViewFirstPage(this.pageNumber);

  @override
  State<FCFSPageViewFirstPage> createState() => _FCFSPageViewFirstPageState();
}

class _FCFSPageViewFirstPageState extends State<FCFSPageViewFirstPage> {
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      VxToast.show(context,
          msg: "${widget.pageNumber}/4", textSize: forHeight(16));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedBoxForHeight(10),
        Text(
          "● First in, first out (FIFO), "
          "also known as first come, first served (FCFS),"
          " is the simplest scheduling algorithm.\n\n"
          "● FIFO simply queues processes in the order "
          "that they arrive in the ready queue.\n\n"
          "● In this, the process that comes first will be"
          " executed first and the next process starts only"
          " after the previous gets fully executed. ",
          style: TextStyle(color: Vx.white, fontSize: forHeight(19)),
        )
      ],
    );
  }
}
