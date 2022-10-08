import 'package:flutter/material.dart';
import 'package:os_project/model/sjf_model.dart';
import 'package:os_project/pageviews/SJF/sjf%20pages/first_page.dart';
import 'package:os_project/pageviews/sjf/sjf%20pages/third_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../main.dart';
import '../../model/color_model.dart';
import '../../widget/help_in_responsive_widgets.dart';
import 'SJF pages/forth_page.dart';
import 'SJF pages/second_page.dart';



class SJFPageView extends StatefulWidget {
  SJFPageView({Key? key}) : super(key: key);

  @override
  State<SJFPageView> createState() => _SJFPageViewState();
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
  {"id": "", "value": 0, "color": ColorModel().blue}
];

class _SJFPageViewState extends State<SJFPageView> {
  @override
  void initState() {
    super.initState();
    setState(() {
      time = 0;
      runPhase = 0;
      isNextPageVisible = false;
      SJFModel.tableListValue = [SJFModel(0, 0, 0, 0, 0, 0, 0, false)];
      showInGraphList = [
        {"id": "", "value": 0, "color": ColorModel().blue}
      ];
    });
  }

  PageController pc = PageController();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [SetheStateMutation]);
    bool isOn = SJFModel.ioSwitch;
    return PageView(
      controller: pc,
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        SJFPageViewFirstPage(1),
        SJFPageViewSecondPage(isOn, pc, 2),
        SJFPageViewThirdPage(3),
        SJFPageViewForthPage(4)
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
