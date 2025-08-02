import 'package:flutter/material.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/common_ui.dart';

Widget optionTile() {
  return Container(
    decoration: CommonUi.roundBoxDecoration(
      color: Colors.grey.withOpacity(0.5),
      borderRadius: 12,
    ),
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Ask Ai a Question",
          style: CommonUi.customTextStyle(
            fontFamily: AppFonts.semiBold,
            fontSize: 16,
          ),
        ),
        Icon(Icons.person),
      ],
    ),
  );
}

/// Option List
Widget optionList() {
  return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return optionTile();
      });
}
