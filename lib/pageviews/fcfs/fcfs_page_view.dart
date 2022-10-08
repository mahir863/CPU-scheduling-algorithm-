import 'package:flutter/material.dart';
import 'package:os_project/pageviews/fcfs/fcfs%20pages/first_page.dart';
import 'package:os_project/pageviews/fcfs/fcfs%20pages/forth_page.dart';
import 'package:os_project/pageviews/fcfs/fcfs%20pages/second_page.dart';
import 'package:os_project/pageviews/fcfs/fcfs%20pages/third_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../main.dart';
import '../../model/color_model.dart';
import '../../model/fcfs_model.dart';
import '../../widget/help_in_responsive_widgets.dart';

class FCFCPageView extends StatefulWidget {
  FCFCPageView({Key? key}) : super(key: key);

  @override
  State<FCFCPageView> createState() => _FCFCPageViewState();
}

int time = 0;
int runPhase = 0;
String runningItem = "";
bool isNextPageVisible = false;
Map<String, dynamic> turnAroundTime = {};
List<dynamic> completionTime = [];
Map<String, dynamic> waitingTime = {};
ScrollController sc = ScrollController();
Map<String, dynamic> completionTimeMap = {};

bool isOnceNoticed = false;
List<Map<String, dynamic>> showInGraphList = [
  {"id": "", "value": 0, "color": ColorModel().red}
];

class _FCFCPageViewState extends State<FCFCPageView> {
  @override
  void initState() {
    super.initState();
    setState(() {
      time = 0;
      runPhase = 0;
      isNextPageVisible = false;
      FCFSModel.tableListValue = [FCFSModel(0, 0, 0, 0, 0, 0, 0, false)];
      showInGraphList = [
        {"id": "", "value": 0, "color": ColorModel().red}
      ];
    });
  }

  PageController pc = PageController();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [SetheStateMutation]);
    bool isOn = FCFSModel.ioSwitch;
    return PageView(
      controller: pc,
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        FCFSPageViewFirstPage(1),
        FCFSPageViewSecondPage(isOn, pc, 2),
        FCFSPageViewThirdPage(3),
        FCFSPageViewForthPage(4)
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
