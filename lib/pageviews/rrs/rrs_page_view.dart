import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../main.dart';
import '../../model/color_model.dart';
import '../../model/rrs_model.dart';
import '../../widget/help_in_responsive_widgets.dart';
import '../fcfs/fcfs_page_view.dart';
import 'RRS pages/forth_page.dart';
import 'rrs pages/first_page.dart';
import 'rrs pages/second_page.dart';
import 'rrs pages/third_page.dart';

class RRSPageView extends StatefulWidget {
  RRSPageView({Key? key}) : super(key: key);

  @override
  State<RRSPageView> createState() => _RRSPageViewState();
}

class _RRSPageViewState extends State<RRSPageView> {
  @override
  void initState() {
    super.initState();
    setState(() {
      time = 0;
      runPhase = 0;
      isNextPageVisible = false;
      RRSModel.tableListValue = [RRSModel(0, 0, 0, 0, 0, 0, 0, false)];
      showInGraphList = [
        {"id": "", "value": 0, "color": ColorModel().red}
      ];
    });
  }

  PageController pc = PageController();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [SetheStateMutation]);
    bool isOn = RRSModel.ioSwitch;
    return PageView(
      controller: pc,
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        RRSPageViewFirstPage(1),
        RRSPageViewSecondPage(isOn, pc, 2),
        RRSPageViewThirdPage(3),
        RRSPageViewForthPage(4)
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
