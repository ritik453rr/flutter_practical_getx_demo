import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_demo/common/common_ui.dart';

Widget expenstionItem({
  ExpansionTileController? controller,
  required String icon,
  void Function(bool)? onExpansionChanged,
  required String title,
  required void Function(bool)? onChangedSwitch,
  required bool switchValue,
  List<Widget> children = const <Widget>[],
}) {
  return ExpansionTile(
    tilePadding: EdgeInsets.zero,
    childrenPadding: EdgeInsets.zero,
    controller: controller,
    leading: CommonUi.setSvgImg(icon),
    title: Text(title),
    expandedAlignment: Alignment.centerLeft,
    shape: const RoundedRectangleBorder(side: BorderSide.none),
    onExpansionChanged: onExpansionChanged,
    trailing: Transform.scale(
      scale: 0.7,
      child: CupertinoSwitch(
        value: switchValue,
        onChanged: onChangedSwitch,
      ),
    ),
    subtitle: const Text(
      "Today",
      style: TextStyle(
        fontSize: 12,
      ),
    ),
    children: children,
  );
}
