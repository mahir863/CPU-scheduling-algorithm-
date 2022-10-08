import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/help_in_responsive_widgets.dart';

class RRSPageViewFirstPage extends StatefulWidget {
  int pageNumber = 0;
  RRSPageViewFirstPage(this.pageNumber);

  @override
  State<RRSPageViewFirstPage> createState() => _RRSPageViewFirstPageState();
}

class _RRSPageViewFirstPageState extends State<RRSPageViewFirstPage> {
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
          "● It is simple, easy to implement, and "
          "starvation-free as all processes get a fair share of CPU.\n\n"
          "● It is preemptive as processes are assigned CPU only for a "
          "fixed slice of time at most.\n\n"
          "● Round Robin is a CPU scheduling algorithm where "
          "each process is assigned a fixed time slot in a cyclic way.",
          style: TextStyle(color: Vx.white, fontSize: forHeight(19)),
        )
      ],
    );
  }
}
