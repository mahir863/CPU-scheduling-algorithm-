import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widget/help_in_responsive_widgets.dart';

PageView pageViewForAboutUs() {
  return PageView(
    physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxForHeight(5),
          Text(
            "Team Members",
            style: TextStyle(
                color: Vx.white,
                fontSize: forHeight(30),
                fontWeight: FontWeight.w700),
          ),
          Text(
            "Group G4",
            style: TextStyle(
                color: Vx.white,
                fontSize: forHeight(23),
                fontWeight: FontWeight.w700),
          ),
          sizedBoxForHeight(30),
          rowForStudentNameAndRollNumber("Sachinkumar Lakum", "20BCP129"),
          sizedBoxForHeight(18),
          rowForStudentNameAndRollNumber("Samarth Parmar", "20BCP114"),
          sizedBoxForHeight(18),
          rowForStudentNameAndRollNumber("Mohmmadali Aglodiya", "20BCP137"),
          sizedBoxForHeight(18),
          rowForStudentNameAndRollNumber("Bhargav Limbasia", "20BCP118"),
          sizedBoxForHeight(18),
          rowForStudentNameAndRollNumber("Mahir Mehta", "20BCP122"),
          sizedBoxForHeight(110),
          GestureDetector(
            onTap: () async => launch(
                "https://github.com/Samarth170102/CPU_Algo_OS_Lab_Project"),
            child: Container(
              height: forHeight(70),
              width: forHeight(170),
              decoration: BoxDecoration(
                  color: Vx.white,
                  borderRadius: BorderRadius.circular(forHeight(4))),
              child: Row(
                children: [
                  Image.asset("assets/icons/github.png")
                      .pSymmetric(v: forHeight(9))
                      .pOnly(left: forWidth(10)),
                  sizedBoxForWidth(10),
                  Text(
                    "GitHub",
                    style: TextStyle(
                        fontSize: forHeight(23), fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ).centered(),
          )
        ],
      ),
    ],
  );
}

Row rowForStudentNameAndRollNumber(String name, String rollNumber) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        name,
        style: TextStyle(
          color: Vx.white,
          fontSize: forHeight(20),
        ),
      ),
      Text(
        rollNumber,
        style: TextStyle(
          color: Vx.white,
          fontSize: forHeight(20),
        ),
      ),
    ],
  );
}
