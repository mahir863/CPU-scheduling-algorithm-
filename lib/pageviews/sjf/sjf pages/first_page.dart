import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/help_in_responsive_widgets.dart';

class SJFPageViewFirstPage extends StatefulWidget {
  int pageNumber = 0;
  SJFPageViewFirstPage(this.pageNumber);

  @override
  State<SJFPageViewFirstPage> createState() => _SJFPageViewFirstPageState();
}

class _SJFPageViewFirstPageState extends State<SJFPageViewFirstPage> {
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
          "● Shortest job first (SJF) is also known as shortest job next.\n\n"
              "● Shortest Job First is a non-pre-emptive algorithm.\n\n"
              "● It selects the waiting process with the smallest execution time to execute next.",
          style: TextStyle(color: Vx.white, fontSize: forHeight(19)),
        )
      ],
    );
  }
}
