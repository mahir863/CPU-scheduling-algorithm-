import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../widget/help_in_responsive_widgets.dart';

class SRTFPageViewFirstPage extends StatefulWidget {
  int pageNumber = 0;
  SRTFPageViewFirstPage(this.pageNumber);

  @override
  State<SRTFPageViewFirstPage> createState() => _SRTFPageViewFirstPageState();
}

class _SRTFPageViewFirstPageState extends State<SRTFPageViewFirstPage> {
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
          "● Shortest Remaining Time First is the pre-emptive "
          "version of Shortest Job First.\n\n"
          "● In the Shortest Remaining Time First (SRTF) scheduling "
          "algorithm, the process with the smallest amount of time "
          "remaining until completion is selected to execute.\n\n"
          "● The process is executed until it is completed or a new "
          "process is added that requires a smaller amount of time.",
          style: TextStyle(color: Vx.white, fontSize: forHeight(19)),
        )
      ],
    );
  }
}
