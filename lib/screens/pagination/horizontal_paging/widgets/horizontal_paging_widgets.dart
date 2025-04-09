import 'package:flutter/material.dart';
import 'package:getx_demo/screens/pagination/horizontal_paging/model/post_model.dart';

/// This widget is used to build a horizontal list of posts.
Widget postBuilder(BuildContext context, PostModel entry, int index) {
  return SizedBox(
    width: 200,
    child: ListTile(
      leading: Icon(
        Icons.person,
        color: Colors.brown[200],
      ),
      title: Text(entry.title),
      subtitle: Text(entry.body),
    ),
  );
}
