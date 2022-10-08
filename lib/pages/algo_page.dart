// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:os_project/main.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widget/help_in_responsive_widgets.dart';

class AlgoPage extends StatefulWidget {
  int mainIndex;
  Widget pageView;
  AlgoPage(this.mainIndex, this.pageView);
  @override
  State<AlgoPage> createState() => _AlgoPageState();
}

class _AlgoPageState extends State<AlgoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.black,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: colors[widget.mainIndex]),
      ),
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            leading: Container(),
            expandedHeight: forHeight(230),
            backgroundColor: colors[widget.mainIndex],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: forHeight(100),
                width: forWidth(100),
                child: Image.asset(
                        "assets/icons/${iconNames[widget.mainIndex]}.png")
                    .pSymmetric(v: forHeight(27)),
              ).pOnly(bottom: forHeight(40)),
              stretchModes: <StretchMode>[StretchMode.zoomBackground],
              titlePadding:
                  EdgeInsets.fromLTRB(forWidth(10), 0, 0, forHeight(6)),
              title: Text(
                fullNames[widget.mainIndex],
                style: TextStyle(color: Vx.black, fontSize: forHeight(14)),
              ).objectBottomCenter(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
                forWidth(10), forHeight(0), forWidth(10), 0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return Container(
                    height: height * 70,
                    child: widget.pageView,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(forHeight(10)),
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
