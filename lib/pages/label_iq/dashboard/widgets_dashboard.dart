import 'package:flutter/material.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/common_ui.dart';

/// Dash Screens
var dashScreens = <Widget>[
  Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 40,
        width: 200,
        padding: EdgeInsets.only(right: 5),
        color: Colors.yellow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.more_vert),
          ],
        ),
      ),
    ],
  )),
  Center(child: Text("Profile")),
];

Widget menuItem({required String title, required IconData icon,bool isLast=false}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: CommonUi.customTextStyle(
                  fontFamily: AppFonts.semiBold,
                )),
            Icon(
              icon,
              color: Colors.black,
            ),
          ],
        ),
      ),
      isLast?
      SizedBox():
      Divider(),
    ],
  );
}
