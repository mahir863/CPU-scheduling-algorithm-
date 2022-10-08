import 'package:os_project/pageviews/rrs/rrs_logic.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../model/color_model.dart';
import '../../../model/rrs_model.dart';
import '../../../pages/rrs_table_class.dart';
import '../../../widget/help_in_responsive_widgets.dart';

class RRSPageViewSecondPage extends StatefulWidget {
  bool isOn;
  PageController pc;
  int pageNumber;
  RRSPageViewSecondPage(this.isOn, this.pc, this.pageNumber);

  @override
  State<RRSPageViewSecondPage> createState() => _RRSPageViewSecondPageState();
}

class _RRSPageViewSecondPageState extends State<RRSPageViewSecondPage> {
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
        sizedBoxForHeight(20),
        Text(
          "Time Quantum\n1 sec",
          style: TextStyle(color: Vx.white, fontSize: forHeight(24)),
        ).pOnly(left: forWidth(10)),
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
              value: RRSModel.ioSwitch,
              activeColor: ColorModel().green,
              inactiveTrackColor: Color.fromARGB(255, 75, 75, 75),
              onChanged: (val) {
                setState(() {
                  RRSModel.ioSwitch = val;
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
                backgroundColor: ColorModel().green,
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
                  color: ColorModel().green,
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
                backgroundColor: ColorModel().green,
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
                color: ColorModel().green,
              ),
            ),
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: ColorModel().green,
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
                  color: ColorModel().green,
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
                  backgroundColor: ColorModel().green,
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
                    color: ColorModel().green,
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
                  backgroundColor: ColorModel().green,
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
                    color: ColorModel().green,
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
            return RRSTableClass(index, isOn);
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
                RRSModel.tableListValue
                    .add(RRSModel(0, 0, 0, 0, 0, 0, 0, false));
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
                  color: ColorModel().green,
                  borderRadius: BorderRadius.circular(forHeight(4)),
                ),
              ),
            ),
            Visibility(
              visible: length > 1,
              child: GestureDetector(
                onTap: () {
                  RRSModel.tableListValue.removeLast();
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
                    color: ColorModel().green,
                    borderRadius: BorderRadius.circular(forHeight(4)),
                  ),
                ),
              ),
            ),
          ],
        ),
        sizedBoxForHeight(30),
        RRSLogic(isOn, widget.pc)
      ],
    );
  }
}
