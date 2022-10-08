import 'package:flutter/services.dart';
import 'package:os_project/model/sjf_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../model/color_model.dart';
import '../widget/help_in_responsive_widgets.dart';

class SJFTableClass extends StatefulWidget {
  int index;
  bool isOn;
  SJFTableClass(this.index, this.isOn);
  @override
  State<SJFTableClass> createState() => _SJFTableClassState();
}

class _SJFTableClassState extends State<SJFTableClass> {
  int atValue = 0;
  int cpuBurstValue = 0;
  int ioTime = 0;
  int cpu = 0;
  @override
  Widget build(BuildContext context) {
    bool isOn = !widget.isOn;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: forHeight(50),
          width: isOn ? width * 30 : width * 18,
          child: Text("P-${widget.index}",
                  style: TextStyle(
                      color: Vx.white,
                      fontWeight: FontWeight.w600,
                      fontSize: forHeight(16)))
              .centered(),
          decoration: BoxDecoration(
            border: Border(
                right: BorderSide(
                  width: forHeight(2),
                  color: ColorModel().blue,
                ),
                left: BorderSide(
                  width: forHeight(2),
                  color: ColorModel().blue,
                ),
                bottom: BorderSide(
                  width: forHeight(2),
                  color: ColorModel().blue,
                )),
          ),
        ),
        Container(
          height: forHeight(50),
          width: isOn ? width * 30 : width * 18,
          child: TextFormField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: 
            TextInputType.phone,
            cursorColor: ColorModel().blue,
            style: TextStyle(
                color: Vx.white,
                fontWeight: FontWeight.w600,
                fontSize: forHeight(16)),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "0",
              hintStyle: TextStyle(
                  color: Vx.gray500,
                  fontWeight: FontWeight.w600,
                  fontSize: forHeight(16)),
            ),
            onChanged: (value) {
              try {
                atValue = int.parse(value);
              } catch (e) {
                atValue = 0;
              }
              SJFModel.tableListValue[widget.index] = SJFModel(
                  widget.index,
                  atValue,
                  atValue,
                  cpuBurstValue,
                  cpuBurstValue,
                  ioTime,
                  cpu,
                  false);
            },
          ),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
              width: forHeight(2),
              color: ColorModel().blue,
            )),
          ),
        ),
        Container(
          height: forHeight(50),
          width: isOn ? width * 30 : width * 18,
          child: TextFormField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: 
            TextInputType.number,
            cursorColor: ColorModel().blue,
            style: TextStyle(
                color: Vx.white,
                fontWeight: FontWeight.w600,
                fontSize: forHeight(16)),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "0",
              hintStyle: TextStyle(
                  color: Vx.gray500,
                  fontWeight: FontWeight.w600,
                  fontSize: forHeight(16)),
              border: InputBorder.none,
            ),
            onChanged: (value2) {
              try {
                cpuBurstValue = int.parse(value2);
              } catch (e) {
                cpuBurstValue = 0;
              }
              SJFModel.tableListValue[widget.index] = SJFModel(
                  widget.index,
                  atValue,
                  atValue,
                  cpuBurstValue,
                  cpuBurstValue,
                  ioTime,
                  cpu,
                  false);
            },
          ),
          decoration: BoxDecoration(
            border: Border(
                right: BorderSide(
                  width: forHeight(2),
                  style: !isOn ? BorderStyle.none : BorderStyle.solid,
                  color: ColorModel().blue,
                ),
                left: BorderSide(
                  width: forHeight(2),
                  color: ColorModel().blue,
                ),
                bottom: BorderSide(
                  width: forHeight(2),
                  color: ColorModel().blue,
                )),
          ),
        ),
        Visibility(
          visible: !isOn,
          child: Container(
            height: forHeight(50),
            width: width * 18,
            child: TextFormField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: 
              TextInputType.phone,
              cursorColor: ColorModel().blue,
              style: TextStyle(
                  color: Vx.white,
                  fontWeight: FontWeight.w600,
                  fontSize: forHeight(16)),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "0",
                hintStyle: TextStyle(
                    color: Vx.gray500,
                    fontWeight: FontWeight.w600,
                    fontSize: forHeight(16)),
                border: InputBorder.none,
              ),
              onChanged: (value3) {
                try {
                  ioTime = int.parse(value3);
                } catch (e) {
                  ioTime = 0;
                }
                SJFModel.tableListValue[widget.index] = SJFModel(
                    widget.index,
                    atValue,
                    atValue,
                    cpuBurstValue,
                    cpuBurstValue,
                    ioTime,
                    cpu,
                    false);
              },
            ),
            decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                    width: forHeight(2),
                    color: ColorModel().blue,
                  ),
                  bottom: BorderSide(
                    width: forHeight(2),
                    color: ColorModel().blue,
                  )),
            ),
          ),
        ),
        Visibility(
          visible: !isOn,
          child: Container(
            height: forHeight(50),
            width: width * 18,
            child: TextFormField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: 
              TextInputType.phone,
              cursorColor: ColorModel().blue,
              style: TextStyle(
                  color: Vx.white,
                  fontWeight: FontWeight.w600,
                  fontSize: forHeight(16)),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "0",
                hintStyle: TextStyle(
                    color: Vx.gray500,
                    fontWeight: FontWeight.w600,
                    fontSize: forHeight(16)),
                border: InputBorder.none,
              ),
              onChanged: (value4) {
                try {
                  cpu = int.parse(value4);
                } catch (e) {
                  cpu = 0;
                }
                SJFModel.tableListValue[widget.index] = SJFModel(
                    widget.index,
                    atValue,
                    atValue,
                    cpuBurstValue,
                    cpuBurstValue,
                    ioTime,
                    cpu,
                    false);
              },
            ),
            decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(
                    width: forHeight(2),
                    color: ColorModel().blue,
                  ),
                  left: BorderSide(
                    width: forHeight(2),
                    color: ColorModel().blue,
                  ),
                  bottom: BorderSide(
                    width: forHeight(2),
                    color: ColorModel().blue,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
