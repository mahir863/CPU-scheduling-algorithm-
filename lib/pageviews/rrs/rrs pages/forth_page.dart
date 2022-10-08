import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../model/color_model.dart';
import '../../../widget/help_in_responsive_widgets.dart';
import '../../fcfs/fcfs pages/forth_page.dart';
import '../../fcfs/fcfs_page_view.dart';

class RRSPageViewForthPage extends StatefulWidget {
  int pageNumber = 0;
  RRSPageViewForthPage(this.pageNumber);

  @override
  State<RRSPageViewForthPage> createState() => _RRSPageViewForthPageState();
}

class _RRSPageViewForthPageState extends State<RRSPageViewForthPage> {
  ScrollController sc = ScrollController();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      VxToast.show(context,
          msg: "${widget.pageNumber}/4", textSize: forHeight(16));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !isNextPageVisible
          ? Text(
              "No Graph",
              style: TextStyle(color: Vx.white, fontSize: forHeight(28)),
            ).centered().pOnly(bottom: forHeight(21))
          : ListView(
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              children: [
                sizedBoxForHeight(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: forHeight(40),
                      width: forHeight(150),
                      decoration: BoxDecoration(
                          color: ColorModel().green,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        runningItem == ""
                            ? "Not Running"
                            : runningItem != "CPU Idle"
                                ? "$runningItem is Running!"
                                : "CPU is Idle",
                        style: TextStyle(color: Vx.black, fontSize: 16),
                      ).centered(),
                    ),
                    Container(
                      height: forHeight(40),
                      width: forHeight(150),
                      decoration: BoxDecoration(
                          color: ColorModel().green,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "Seconds: $time",
                        style:
                            TextStyle(color: Vx.black, fontSize: forHeight(16)),
                      ).centered(),
                    ),
                  ],
                ),
                sizedBoxForHeight(40),
                Container(
                  constraints: BoxConstraints(maxHeight: forHeight(370)),
                  child: ListView.builder(
                    reverse: true,
                    controller: sc,
                    physics: AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    itemCount: showInGraphList.length - 1,
                    itemBuilder: (BuildContext context, int index) {
                      String endTime;
                      try {
                        endTime = endItemTime[index].toString();
                      } catch (e) {
                        endTime = "";
                      }
                      return ListView(
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            height: forHeight(70),
                            child: Text(showInGraphList[index]["color"] ==
                                        ColorModel().green
                                    ? ""
                                    : showInGraphList[index]["id"])
                                .centered()
                                .pOnly(
                                    left: showInGraphList[index]["id"] ==
                                                "CPU Idle" &&
                                            double.parse(showInGraphList[index]
                                                        ["value"]
                                                    .toString()) ==
                                                forWidth(60)
                                        ? forWidth(14)
                                        : 0),
                            width: double.parse(
                                showInGraphList[index]["value"].toString()),
                            color: showInGraphList[index]["color"],
                          ).objectCenterLeft(),
                          sizedBoxForWidth(10),
                          Text(
                            endTime,
                            style: TextStyle(
                                fontSize: forHeight(18), color: Vx.white),
                          ).objectCenter()
                        ],
                      ).h(forHeight(70));
                    },
                  ),
                ),
                sizedBoxForHeight(50),
                ElevatedButton(
                  onPressed: () async {
                    if (runPhase == 0) {
                      setState(() {
                        runPhase = 1;
                      });
                      int j = 0;
                      int animatelimit = 3;
                      double offsetOfAnimatedScroll = forHeight(100);
                      for (var i = 0; i < completionTime.length; i++) {
                        if (i == 0) {
                          int value = showInGraphList[0]["value"] +=
                              forWidth(80).round();
                          runningItem = completionTime[0];
                          showInGraphList[0] = {
                            "id": completionTime[0],
                            "value": value,
                            "color": ColorModel().green
                          };
                          runPhase = 1;
                          setState(() {});
                          await Future.delayed(Duration(seconds: 1));
                          time++;
                          setState(() {});
                        } else {
                          if (completionTime[i] == completionTime[i - 1]) {
                            runningItem = completionTime[i];
                            int value = showInGraphList[j]["value"] +=
                                forWidth(80).round();
                            showInGraphList[j] = {
                              "id": completionTime[i],
                              "value": value,
                              "color": ColorModel().green
                            };
                            await Future.delayed(Duration(seconds: 1));
                            time++;
                            setState(() {});
                          } else {
                            endItemTime.add(time);
                            showInGraphList[j] = {
                              "id": completionTime[i - 1],
                              "value": showInGraphList[j]["value"],
                              "color": Vx.white
                            };
                            j++;
                            runningItem = completionTime[i];
                            int value = showInGraphList[j]["value"] +=
                                forWidth(80).round();
                            showInGraphList[j] = {
                              "id": completionTime[i],
                              "value": value,
                              "color": ColorModel().green
                            };
                            await Future.delayed(Duration(seconds: 1));
                            time++;
                            if (showInGraphList.length > 5 &&
                                j > animatelimit &&
                                j != showInGraphList.length - 2) {
                              sc.animateTo(offsetOfAnimatedScroll,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.linear);
                              offsetOfAnimatedScroll += forHeight(60);
                              animatelimit++;
                              setState(() {});
                            }
                            setState(() {});
                          }
                        }
                      }
                      runningItem = "";
                      showInGraphList[j] = {
                        "id": completionTime.last,
                        "value": showInGraphList[j]["value"],
                        "color": Vx.white
                      };
                      endItemTime.add(time);
                      setState(() {
                        runPhase = 2;
                      });
                    } else if (runPhase == 1) {
                    } else {
                      endItemTime.clear();
                      for (var i = 0; i < showInGraphList.length; i++) {
                        showInGraphList[i] = {
                          "id": "",
                          "value": 0,
                          "color": ColorModel().green
                        };
                      }
                      setState(() {
                        runningItem = "";
                        time = 0;
                        runPhase = 0;
                      });
                    }
                  },
                  style: TextButton.styleFrom(
                      fixedSize: Size(forHeight(120), forHeight(50)),
                      backgroundColor:
                          runPhase == 1 ? Vx.gray400 : ColorModel().green),
                  child: Text(
                    runPhase == 0 || runPhase == 1 ? "Run" : "Reset",
                    style: TextStyle(
                        color: runPhase == 1 ? Vx.white : Vx.black,
                        fontSize: forHeight(20)),
                  ),
                ).objectBottomCenter()
              ],
            ),
    );
  }
}
