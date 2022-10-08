import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../main.dart';
import '../../model/color_model.dart';
import '../../model/rrs_model.dart';
import '../../widget/help_in_responsive_widgets.dart';
import '../fcfs/fcfs pages/forth_page.dart';
import '../fcfs/fcfs_page_view.dart';

class RRSLogic extends StatefulWidget {
  bool isOn;
  PageController pc;
  RRSLogic(this.isOn, this.pc);
  @override
  State<RRSLogic> createState() => _RRSLogicState();
}

class _RRSLogicState extends State<RRSLogic> {
  @override
  Widget build(BuildContext context) {
    bool isOn = widget.isOn;
    return GestureDetector(
      onTap: () {
        endItemTime = [];
        for (var i = 0; i < RRSModel.tableListValue.length; i++) {
          //Passsing RRS Model to item variable
          RRSModel item = RRSModel.tableListValue[i];

          //! Resets to old value of table list items
          RRSModel.tableListValue[i] = RRSModel(
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

        //! Iterating items from RRS Model tableListValue
        for (var item in RRSModel.tableListValue) {
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
          totalCpuIdleTime = 0; // Total Idle time of CPU
          averageWaitingTime = 0; //Average Waiting time of processes
          showInGraphList = [
            {"id": "", "value": 0, "color": ColorModel().green}
          ]; //List for process animation

          RRSModel.tableListValue = RRSModel.tableListValue
              .sortedBy((a, b) => a.atValue.compareTo(b.atValue));
          // *Time complexity - O(n*log(n)), Space complexity - O(1)

          if (RRSModel.tableListValue[0].atValue > 0) {
            for (var i = 0; i < RRSModel.tableListValue[0].atValue; i++) {
              completionTime.add("CPU Idle");
            } // *Time complexity - O(n), Space complexity - O(n)
            totalCpuIdleTime = completionTime.length;
          }
          if (isOn) {
            bool isDone = false;
            while (true) {
              isDone = false;
              for (var j = 0; j < RRSModel.tableListValue.length; j++) {
                RRSModel item = RRSModel.tableListValue[j];
                if (item.cpuBurstValue > 0) {
                  isDone = true;
                  RRSModel.tableListValue[j] = RRSModel(
                      item.id,
                      item.atValue,
                      item.oldAtValue,
                      item.cpuBurstValue - 1,
                      item.oldcpuBurstValue,
                      item.ioTime,
                      item.cpu,
                      item.isFinish);
                  completionTime.add("P-${item.id}");
                } else {
                  if (item.ioTime >= 0 &&
                      RRSModel.tableListValue.length - 1 != item.id) {
                    RRSModel.tableListValue[j] = RRSModel(
                        item.id,
                        item.atValue,
                        item.oldAtValue,
                        -item.ioTime,
                        item.oldcpuBurstValue,
                        item.ioTime - 1,
                        item.cpu,
                        item.isFinish);
                  }
                  if (item.ioTime == 0) {
                    RRSModel.tableListValue[j] = RRSModel(
                        item.id,
                        item.atValue,
                        item.oldAtValue,
                        item.cpu,
                        item.oldcpuBurstValue,
                        item.ioTime,
                        item.cpu,
                        item.isFinish);
                  }
                }
              }
              if (!isDone) {
                break;
              }
            } // *Time complexity - O(n*2), Space complexity - O(n)
            completionTime.addAll(List.generate(
                RRSModel.tableListValue.last.ioTime, (index) => "CPU Idle"));
            completionTime.addAll(List.generate(
                RRSModel.tableListValue.last.cpu,
                (index) => "P-${RRSModel.tableListValue.length - 1}"));
            for (var item in RRSModel.tableListValue) {
              completionTimeMap["P-${item.id}"] =
                  completionTime.lastIndexOf("P-${item.id}") + 1;
              turnAroundTime["P-${item.id}"] =
                  completionTime.length - item.oldAtValue;
              waitingTime["P-${item.id}"] = turnAroundTime["P-${item.id}"] -
                  (item.oldcpuBurstValue + item.cpu);
              averageWaitingTime += waitingTime["P-${item.id}"];
            }
          }
          //! When I/O is OFF
          else {
            bool isDone = false;
            while (true) {
              isDone = false;
              for (var j = 0; j < RRSModel.tableListValue.length; j++) {
                RRSModel item = RRSModel.tableListValue[j];
                if (item.cpuBurstValue > 0) {
                  isDone = true;
                  RRSModel.tableListValue[j] = RRSModel(
                      item.id,
                      item.atValue,
                      item.oldAtValue,
                      item.cpuBurstValue - 1,
                      item.oldcpuBurstValue,
                      item.ioTime,
                      item.cpu,
                      item.isFinish);
                  completionTime.add("P-${item.id}");
                }
              }
              if (!isDone) {
                break;
              }
            } // *Time complexity - O(n*2), Space complexity - O(n)
            for (var item in RRSModel.tableListValue) {
              completionTimeMap["P-${item.id}"] =
                  completionTime.lastIndexOf("P-${item.id}") + 1;
              turnAroundTime["P-${item.id}"] =
                  completionTime.length - item.oldAtValue;
              waitingTime["P-${item.id}"] = turnAroundTime["P-${item.id}"] -
                  (item.oldcpuBurstValue + item.cpu);
              averageWaitingTime += waitingTime["P-${item.id}"];
            } // *Time complexity - O(n), Space complexity - O(n)
          }
          averageWaitingTime =
              averageWaitingTime / RRSModel.tableListValue.length;
          for (var i = 0; i < completionTime.length; i++) {
            if (i == 0 || completionTime[i] != completionTime[i - 1]) {
              showInGraphList
                  .add({"id": "", "value": 0, "color": ColorModel().green});
            }
          } // *Time complexity - O(n), Space complexity - O(n)

          RRSModel.tableListValue =
              RRSModel.tableListValue.sortedBy((a, b) => a.id.compareTo(b.id));
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
          color: ColorModel().green,
          borderRadius: BorderRadius.circular(forHeight(4)),
        ),
      ),
    ).centered();
  }
}
