import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../main.dart';
import '../model/SJF_model.dart';
import '../widget/help_in_responsive_widgets.dart';

class Documentation extends StatefulWidget {
  Documentation({Key? key}) : super(key: key);

  @override
  State<Documentation> createState() => _DocumentationState();
}

class _DocumentationState extends State<Documentation> {
  int length = 1;
  @override
  Widget build(BuildContext context) {
    bool isOn = SJFModel.ioSwitch;
    return PageView(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              itemCount: 4,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async => launch(documentsLinks[index]),
                  child: Container(
                    height: forHeight(131),
                    decoration: BoxDecoration(
                      color: colors[4],
                      borderRadius: BorderRadius.circular(
                        forHeight(6),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/icons/${iconNames[index]}.png",
                          height: index == 2 ? forHeight(70) : forHeight(80),
                        ),
                        sizedBoxForWidth(15),
                        Container(
                            height: 131,
                            width: width * 65.3,
                            child: Text(
                              fullNames[index],
                              style: TextStyle(
                                  fontSize: forHeight(20),
                                  fontWeight: FontWeight.w600),
                            ).objectCenterLeft())
                      ],
                    ).pOnly(left: forWidth(15)),
                  ).pOnly(top: index == 0 ? forHeight(25) : 0),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return sizedBoxForHeight(12);
              },
            ),
          ],
        ),
      ],
    );
  }
}
