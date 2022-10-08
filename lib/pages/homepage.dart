import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:os_project/pages/algo_page.dart';
import 'package:os_project/widget/help_in_responsive_widgets.dart';
import 'package:os_project/main.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      slivers: <Widget>[
        SliverAppBar(
          stretch: true,
          expandedHeight: forHeight(180),
          backgroundColor: Vx.white,
          flexibleSpace: FlexibleSpaceBar(
            background: GestureDetector(
              onTap: () => showModalBottomSheet(
                  builder: (context) => Container(
                        color: Vx.black,
                        height: forHeight(342),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What is Scheduling?",
                              style: TextStyle(
                                  fontSize: forHeight(20),
                                  fontWeight: FontWeight.w800,
                                  color: Vx.white),
                            ),
                            sizedBoxForHeight(4),
                            Text(
                              "Scheduling of processes is done to finish the work on time. ",
                              style: TextStyle(
                                  fontSize: forHeight(16), color: Vx.white),
                            ),
                            sizedBoxForHeight(20),
                            Text(
                              "Why do we need scheduling?",
                              style: TextStyle(
                                  fontSize: forHeight(20),
                                  fontWeight: FontWeight.w800,
                                  color: Vx.white),
                            ),
                            sizedBoxForHeight(4),
                            Text(
                              "I/O and CPU time are both involved in a "
                              "typical procedure. Time spent waiting for "
                              "I/O in a uniprogramming system like MS-DOS "
                              "is wasted, and CPU is free during this time. "
                              "One process can use the CPU while another waits "
                              "for I/O in multiprogramming systems. Only process "
                              "scheduling allows for this.",
                              style: TextStyle(
                                  fontSize: forHeight(16), color: Vx.white),
                            )
                          ],
                        ).pLTRB(forWidth(15), forHeight(20), forWidth(15), 0),
                      ),
                  context: context),
              child: Container(
                height: forHeight(100),
                width: forWidth(100),
                child: Image.asset("assets/icons/app_icon.png")
                    .pSymmetric(v: forHeight(13)),
              ).pOnly(bottom: forHeight(40)),
            ),
            stretchModes: <StretchMode>[StretchMode.zoomBackground],
            titlePadding: EdgeInsets.fromLTRB(forWidth(10), 0, 0, forHeight(6)),
            title: Text(
              "CPU Scheduling Algorithms",
              style: TextStyle(color: Vx.black, fontSize: forHeight(16)),
            ).objectBottomCenter(),
          ),
        ),
        SliverPadding(
          padding:
              EdgeInsets.fromLTRB(forWidth(10), forHeight(20), forWidth(10), 0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: forHeight(11),
                crossAxisSpacing: forWidth(11)),
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) =>
                            AlgoPage(index, pagesViews[index]),
                      )),
                  onLongPress: () =>
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: colors[index],
                    duration: Duration(milliseconds: 1600),
                    content: Text(
                      fullNames[index],
                      style:
                          TextStyle(color: Vx.black, fontSize: forHeight(18)),
                    ),
                  )),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset("assets/icons/${iconNames[index]}.png")
                            .pSymmetric(
                          h: index == 0
                              ? forWidth(38)
                              : index == 5 || index == 4 || index == 2
                                  ? forWidth(40)
                                  : forWidth(35),
                        ),
                        sizedBoxForHeight(index == 0
                            ? 13
                            : index == 5 || index == 4
                                ? 24
                                : 20),
                        Text(
                          shortNames[index],
                          style: TextStyle(
                              fontSize: forHeight(16),
                              fontWeight: FontWeight.w600),
                        ),
                        sizedBoxForHeight(8),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: colors[index],
                      borderRadius: BorderRadius.circular(forHeight(10)),
                    ),
                  ),
                );
              },
              childCount: 6,
            ),
          ),
        ),
      ],
    );
  }
}
