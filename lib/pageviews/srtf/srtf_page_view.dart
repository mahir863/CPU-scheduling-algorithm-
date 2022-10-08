import 'package:flutter/material.dart';
import 'package:os_project/model/srtf_model.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../main.dart';
import '../../model/color_model.dart';
import '../../widget/help_in_responsive_widgets.dart';
import '../fcfs/fcfs_page_view.dart';
import 'srtf pages/first_page.dart';
import 'srtf pages/forth_page.dart';
import 'srtf pages/second_page.dart';
import 'srtf pages/third_page.dart';

class SRTFPageView extends StatefulWidget {
  SRTFPageView({Key? key}) : super(key: key);

  @override
  State<SRTFPageView> createState() => _SRTFPageViewState();
}

bool isOnceNoticed = false;
List<Map<String, dynamic>> showInGraphList = [
  {"id": "", "value": 0, "color": ColorModel().blue}
];

class _SRTFPageViewState extends State<SRTFPageView> {
  @override
  void initState() {
    super.initState();
    setState(() {
      time = 0;
      runPhase = 0;
      isNextPageVisible = false;
      SRTFModel.tableListValue = [SRTFModel(0, 0, 0, 0, 0, 0, 0, false)];
      showInGraphList = [
        {"id": "", "value": 0, "color": ColorModel().blue}
      ];
    });
  }

  PageController pc = PageController();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [SetheStateMutation]);
    bool isOn = SRTFModel.ioSwitch;
    return PageView(
      controller: pc,
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        SRTFPageViewFirstPage(1),
        SRTFPageViewSecondPage(isOn, pc, 2),
        SRTFPageViewThirdPage(3),
        SRTFPageViewForthPage(4)
      ],
    );
  }
}

Row rowForValueDisplay(String type, String val) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        type,
        style: TextStyle(
          color: Vx.black,
          fontSize: forHeight(20),
          fontWeight: FontWeight.w700,
        ),
      ),
      Text(
        val,
        style: TextStyle(
          color: Vx.black,
          fontSize: forHeight(20),
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}
