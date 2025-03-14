import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_demo/common/app_colors.dart";
import 'package:getx_demo/screens/date_time/date_time_widgets.dart';

class DateTimeView extends StatelessWidget {
  const DateTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Date Time",
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            DateTimeWidgets.easyDateTimeline(),
            const SizedBox(
              height: 20,
            ),
            DateTimeWidgets.calendarDatePicker2(),
            const SizedBox(
              height: 20,
            ),
            DateTimeWidgets.cupertinoTimePicker(),
          ],
        ),
      ),
    );
  }
}
