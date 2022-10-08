import 'package:os_project/pageviews/fcfs/fcfs%20pages/forth_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../model/color_model.dart';
import '../../../model/fcfs_model.dart';
import '../../../pages/fcfs_table_class.dart';
import '../../../widget/help_in_responsive_widgets.dart';
import '../fcfs_page_view.dart';

class FCFSPageViewSecondPage extends StatefulWidget {
  bool isOn;
  PageController pc;
  int pageNumber;
  FCFSPageViewSecondPage(this.isOn, this.pc, this.pageNumber);

  @override
    State<FCFSPageViewSecondPage> createState() => _FCFSPageViewSecondPageState();
}

class _FCFSPageViewSecondPageState extends State<FCFSPageViewSecondPage> {
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      VxToast.show(context,
          msg: "${widget.pageNumber}/4", textSize: forHeight(16));
    });
  }

  int length = 1;
  @override
  Widget build(BuildContext context) {
    bool isOn = widget.isOn;
    return ListView(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        sizedBoxForHeight(30),
        Row(
          children: [
            Text(
              "I/O Burst",
              style: TextStyle(
                  color: Vx.white,
                  fontWeight: FontWeight.w600,
                  fontSize: forHeight(16)),
            ).pOnly(left: forWidth(10)),
            Switch(
              value: FCFSModel.ioSwitch,
              activeColor: ColorModel().red,
              inactiveTrackColor: Color.fromARGB(255, 75, 75, 75),
              onChanged: (val) {
                setState(() {
                  FCFSModel.ioSwitch = val;
                  SetheStateMutation();
                });
              },
            ).objectBottomLeft(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: ColorModel().red,
                duration: Duration(milliseconds: 1600),
                content: Text(
                  "Process-ID",
                  style: TextStyle(color: Vx.black, fontSize: forHeight(18)),
                ),
              )),
              child: Container(
                height: forHeight(57),
                width: !isOn ? width * 30 : width * 18,
                child: Text(
                  "P-ID",
                  style: TextStyle(
                      color: Vx.black,
                      fontWeight: FontWeight.w600,
                      fontSize: forHeight(16)),
                ).centered(),
                decoration: BoxDecoration(
                  color: ColorModel().red,
                  border: Border(
                      right: BorderSide(
                    width: forHeight(2),
                    color: Vx.black,
                  )),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: ColorModel().red,
                duration: Duration(milliseconds: 1600),
                content: Text(
                  "Arrival Time",
                  style: TextStyle(color: Vx.black, fontSize: forHeight(18)),
                ),
              )),
              child: Container(
                height: forHeight(57),
                width: !isOn ? width * 30 : width * 18,
                child: Text(
                  "AT",
                  style: TextStyle(
                      color: Vx.black,
                      fontWeight: FontWeight.w600,
                      fontSize: forHeight(16)),
                ).centered(),
                color: ColorModel().red,
              ),
            ),
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: ColorModel().red,
                duration: Duration(milliseconds: 1600),
                content: Text(
                  "CPU Burst Time",
                  style: TextStyle(color: Vx.black, fontSize: forHeight(18)),
                ),
              )),
              child: Container(
                height: forHeight(57),
                width: !isOn ? width * 30 : width * 18,
                child: Text(
                  "CPU\nBurst",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Vx.black,
                      fontWeight: FontWeight.w600,
                      fontSize: forHeight(16)),
                ).centered(),
                decoration: BoxDecoration(
                  color: ColorModel().red,
                  border: Border(
                      left: BorderSide(
                    width: forHeight(2),
                    color: Vx.black,
                  )),
                ),
              ),
            ),
            Visibility(
              visible: isOn,
              child: GestureDetector(
                onTap: () =>
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: ColorModel().red,
                  duration: Duration(milliseconds: 1600),
                  content: Text(
                    "Input/Output Time",
                    style: TextStyle(color: Vx.black, fontSize: forHeight(18)),
                  ),
                )),
                child: Container(
                  height: forHeight(57),
                  width: width * 18,
                  child: Text(
                    "I/O",
                    style: TextStyle(
                        color: Vx.black,
                        fontWeight: FontWeight.w600,
                        fontSize: forHeight(16)),
                  ).centered(),
                  decoration: BoxDecoration(
                    color: ColorModel().red,
                    border: Border(
                        left: BorderSide(
                      width: forHeight(2),
                      color: Vx.black,
                    )),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isOn,
              child: GestureDetector(
                onTap: () =>
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: ColorModel().red,
                  duration: Duration(milliseconds: 1600),
                  content: Text(
                    "CPU Time",
                    style: TextStyle(color: Vx.black, fontSize: forHeight(18)),
                  ),
                )),
                child: Container(
                  height: forHeight(57),
                  width: width * 18,
                  child: Text(
                    "CPU",
                    style: TextStyle(
                        color: Vx.black,
                        fontWeight: FontWeight.w600,
                        fontSize: forHeight(16)),
                  ).centered(),
                  decoration: BoxDecoration(
                    color: ColorModel().red,
                    border: Border(
                        left: BorderSide(
                      width: forHeight(2),
                      color: Vx.black,
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
        ListView.builder(
          itemCount: length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return FCFSTableClass(index, isOn);
          },
        ),
        sizedBoxForHeight(30),
        Row(
          mainAxisAlignment: length > 1
              ? MainAxisAlignment.spaceAround
              : MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                FCFSModel.tableListValue
                    .add(FCFSModel(0, 0, 0, 0, 0, 0, 0, false));
                setState(() {
                  length++;
                });
              },
              child: Container(
                height: forHeight(48),
                width: forHeight(115),
                child: Text(
                  "Add",
                  style: TextStyle(
                      color: Vx.black,
                      fontWeight: FontWeight.w600,
                      fontSize: forHeight(16)),
                ).centered(),
                decoration: BoxDecoration(
                  color: ColorModel().red,
                  borderRadius: BorderRadius.circular(forHeight(4)),
                ),
              ),
            ),
            Visibility(
              visible: length > 1,
              child: GestureDetector(
                onTap: () {
                  FCFSModel.tableListValue.removeLast();
                  setState(() {
                    length--;
                  });
                },
                child: Container(
                  height: forHeight(48),
                  width: forHeight(115),
                  child: Text(
                    "Remove",
                    style: TextStyle(
                        color: Vx.black,
                        fontWeight: FontWeight.w600,
                        fontSize: forHeight(16)),
                  ).centered(),
                  decoration: BoxDecoration(
                    color: ColorModel().red,
                    borderRadius: BorderRadius.circular(forHeight(4)),
                  ),
                ),
              ),
            ),
          ],
        ),
        sizedBoxForHeight(30),
        GestureDetector(
          onTap: () {
            for (var i = 0; i < FCFSModel.tableListValue.length; i++) {
              //Passsing FCFS Model to item variable
              FCFSModel item = FCFSModel.tableListValue[i];

              //! Resets to old value of table list items
              FCFSModel.tableListValue[i] = FCFSModel(
                  item.id,
                  item.oldAtValue,
                  item.oldAtValue,
                  item.oldcpuBurstValue,
                  item.oldcpuBurstValue,
                  item.ioTime,
                  item.cpu,
                  false);
            } // *Time complexity - O(n), Space complexity - O(1)
            bool isFieldsEmpty =
                false; //To make sure CPU Burst Time entities are not zero

            //! Iterating items from FCFS Model tableListValue
            for (var item in FCFSModel.tableListValue) {
              // If I/O Switch is enabled
              if (isOn) {
                isFieldsEmpty = item.cpuBurstValue != 0 || item.cpu != 0;
              } //If I/O Switch is disabled

              else {
                isFieldsEmpty = item.cpuBurstValue != 0;
              }

              //Break when CPU Burst entity are 0
              if (!isFieldsEmpty) {
                break;
              }
            } // *Time complexity - O(n), Space complexity - O(1)

            if (isFieldsEmpty) {
              //? Resets old values when re-calculating
              /*
              List of Process IDs for every second 
              e.g - [P-1,P-1,CPU IDLE,P-2]
              */
              completionTime.clear();

              /*
              Denotes Phase of Gantt Chart Animation
              0 - Not running
              1 - Running
              2 - Finished and waiting for Reset
              */
              runPhase = 0;
              time = 0; //Represents Runtime
              endItemTime = []; //List of Completion Time of processes
              totalCpuIdleTime = 0; // Total Idle time of CPU
              averageWaitingTime = 0; //Average Waiting time of processes
              showInGraphList = [
                {"id": "", "value": 0, "color": ColorModel().red}
              ]; //List for process animation

              FCFSModel.tableListValue = FCFSModel.tableListValue
                  .sortedBy((a, b) => a.atValue.compareTo(b.atValue));
              // *Time complexity - O(n*log(n)), Space complexity - O(1)

              if (FCFSModel.tableListValue[0].atValue > 0) {
                for (var i = 0; i < FCFSModel.tableListValue[0].atValue; i++) {
                  completionTime.add("CPU Idle");
                } // *Time complexity - O(n), Space complexity - O(n)
                totalCpuIdleTime = completionTime.length;
              }
              if (isOn) {
                for (var i = 0; i < FCFSModel.tableListValue.length * 2;) {
                  FCFSModel item = FCFSModel.tableListValue[0];

                  // Adds entities according to process IDs
                  completionTime.addAll(List.generate(
                      item.cpuBurstValue, (index) => "P-${item.id}"));
                  // *Time complexity - O(k), where k is the number of arguments passed
                  // *Space complexity - O(k), where k is the number of arguments added

                  num at = item.isFinish
                      ? 99999
                      : item.ioTime + completionTime.length;
                  /*
                    If the process has returned from I/O, its arrival time is 
                    set to 9999 and if it is being executed before going to 
                    I/O its arrival time is set to Completion time + I/O time 
                    which signifies the time when it’ll return from I/O.
                  */
                  if (item.isFinish) {
                    /*
                    If the process has returned after I/O, its completion, 
                    turn around and waiting time will be calculated as below:
                    */
                    //?Completion time = Given CPU Burst Time
                    //?Turn Around TIme = Completion Time - Arrival Time
                    //?Waiting Time = Turn Around Time - CPU Burst TIme
                    completionTimeMap["P-${item.id}"] = completionTime.length;
                    turnAroundTime["P-${item.id}"] =
                        completionTime.length - item.oldAtValue;
                    waitingTime["P-${item.id}"] =
                        turnAroundTime["P-${item.id}"] -
                            (item.oldcpuBurstValue + item.cpu);
                    averageWaitingTime += waitingTime["P-${item.id}"];
                  }

                  /*
                  Reinitialize item by replacing new arrival time value
                  and CPU Burst value 
                  */
                  item = FCFSModel(
                      item.id,
                      at.round(),
                      item.oldAtValue,
                      item.cpu,
                      item.oldcpuBurstValue,
                      item.ioTime,
                      item.cpu,
                      true);
                  FCFSModel.tableListValue[0] = item;

                  //CPU Idle time calcuation
                  if (FCFSModel.tableListValue[1].atValue >
                          completionTime.length &&
                      FCFSModel.tableListValue[1].isFinish &&
                      i != FCFSModel.tableListValue.length * 2 - 1) {
                    List cpuIdle = List.generate(
                        FCFSModel.tableListValue[1].atValue -
                            completionTime.length,
                        (index) => "CPU Idle");
                    completionTime.addAll(cpuIdle);
                    // *Time complexity - O(m), where m is the number of arguments passed
                    // *Space complexity - O(m), where m is the number of arguments added

                    totalCpuIdleTime += cpuIdle.length;
                  }
                  FCFSModel.tableListValue = FCFSModel.tableListValue
                      .sortedBy((a, b) => a.atValue.compareTo(b.atValue));
                  i++;
                } // *Time complexity - O(n*k*m(log(n)), Space complexity - O(k*m)
              }
              //! When I/O is OFF
              else {
                for (var i = 0; i < FCFSModel.tableListValue.length; i++) {
                  FCFSModel item = FCFSModel.tableListValue[i];

                  if (item.atValue > completionTime.length && i != 0) {
                    List cpuIdle = List.generate(
                        item.atValue - completionTime.length,
                        (index) => "CPU Idle");
                    completionTime.addAll(cpuIdle);
                    // *Time complexity - O(m), where m is the number of arguments passed
                    // *Space complexity - O(m), where m is the number of arguments added

                    totalCpuIdleTime += cpuIdle.length;
                  }

                  completionTime.addAll(List.generate(
                      item.cpuBurstValue, (index) => "P-${item.id}"));
                  // *Time complexity - O(k), where k is the number of arguments passed
                  // *Space complexity - O(k), where k is the number of arguments added

                  //?Completion time = Given CPU Burst Time
                  //?Turn Around TIme = Completion Time - Arrival Time
                  //?Waiting Time = Turn Around Time - CPU Burst Time
                  completionTimeMap["P-${item.id}"] = completionTime.length;
                  turnAroundTime["P-${item.id}"] =
                      (completionTime.length - item.atValue);
                  waitingTime["P-${item.id}"] =
                      (turnAroundTime["P-${item.id}"] - item.cpuBurstValue);
                  averageWaitingTime += waitingTime["P-${item.id}"];
                } // *Time complexity - O(n*k*m), Space complexity - O(k*m)
              }
              averageWaitingTime =
                  averageWaitingTime / FCFSModel.tableListValue.length;
              for (var i = 0; i < completionTime.length; i++) {
                if (i == 0 || completionTime[i] != completionTime[i - 1]) {
                  showInGraphList
                      .add({"id": "", "value": 0, "color": ColorModel().red});
                }
              } // *Time complexity - O(n), Space complexity - O(n)

              FCFSModel.tableListValue = FCFSModel.tableListValue
                  .sortedBy((a, b) => a.id.compareTo(b.id));
              // *Time complexity - O(n*log(n)), Space complexity - O(1)

              setState(() {
                isNextPageVisible = true;
              });
              widget.pc.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            }
            //!Show toast when any CPU entity is 0
            else {
              VxToast.show(
                context,
                msg: "Please Enter Burst Time",
                textSize: forHeight(16),
              );
            }
          },
          child: Container(
            height: forHeight(48),
            width: forHeight(155),
            child: Text(
              "Calculate",
              style: TextStyle(
                  color: Vx.black,
                  fontWeight: FontWeight.w600,
                  fontSize: forHeight(16)),
            ).centered(),
            decoration: BoxDecoration(
              color: ColorModel().red,
              borderRadius: BorderRadius.circular(forHeight(4)),
            ),
          ),
        ).centered(),
      ],
    );
  }
}
