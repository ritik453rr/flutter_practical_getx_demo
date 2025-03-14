import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/app_fonts.dart';

class DateTimeWidgets {
  /// Calendar Date Picker 2
  static Widget calendarDatePicker2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, bottom: 20),
          child: Text(
            "calendar_date_picker2: ^1.1.9",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
            ),
          ),
        ),
        CalendarDatePicker2(
          value: [DateTime.now()],
          onValueChanged: (dates) {},
          config: CalendarDatePicker2Config(
            firstDate: DateTime(2021, 1, 1),
            lastDate: DateTime(2080, 12, 31),
            disableMonthPicker: true,
            firstDayOfWeek: 1,
            controlsTextStyle: const TextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontFamily: AppFonts.fontSemiBold),
            customModePickerIcon: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.blue,
            ),
            selectedDayHighlightColor: AppColors.blue,
            daySplashColor: AppColors.transparent,
            lastMonthIcon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: AppColors.blue,
            ),
            nextMonthIcon: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: AppColors.blue,
            ),
            weekdayLabels: const [
              "Sun",
              "Mon",
              "Tue",
              "Wed",
              "Thu",
              "Fri",
              "Sat",
            ],
          ),
        ),
      ],
    );
  }

  /// Easy Date Timeline
  static Widget easyDateTimeline() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, bottom: 20),
          child: Text(
            "easy_date_timeline: ^1.1.3",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
            ),
          ),
        ),
        EasyDateTimeLine(
          initialDate: DateTime.now(),
          timeLineProps: EasyTimeLineProps(
            backgroundColor: Colors.white,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: List.empty(),
              shape: BoxShape.rectangle,
            ),
          ),
          headerProps: const EasyHeaderProps(
            showHeader: false,
          ),
          dayProps: EasyDayProps(
            dayStructure: DayStructure.dayStrDayNum,
            activeDayStyle: DayStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.colorSlateGray,
              ),
            ),
            inactiveDayStyle: DayStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.white,
              ),
            ),
            todayStyle: DayStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.white,
                border: Border.all(
                  color: AppColors.black,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Cupertino Date Picker
  static Widget cupertinoTimePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 20),
          child: Text(
            "Cupertino Date Picker - Default",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
            ),
          ),
        ),
        SizedBox(
          height: 214,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (DateTime newDateTime) {},
          ),
        ),
      ],
    );
  }
}
