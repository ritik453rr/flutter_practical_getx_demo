import "package:easy_date_timeline/easy_date_timeline.dart";
import "package:flutter/material.dart";
import "package:getx_demo/common/app_colors.dart";

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            SizedBox(height:50),
            const Text("Calendar View"),
            Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                backgroundColor: Colors.transparent,
              ),
              child: EasyDateTimeLine(
                initialDate: DateTime.now(),
                timeLineProps: EasyTimeLineProps(
                  hPadding: 0,
                  vPadding: 0,
                  backgroundColor: Colors.white,
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: AppColors.colorWhite,
                    boxShadow: List.empty(),
                    borderRadius: BorderRadius.circular(30),
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
                    //splashBorder: BorderRadius.circular(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.colorWhite,
                      //shape: BoxShape.circle,
                    ),
                  ),
                  todayStyle: DayStyle(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.colorWhite,
                      border: Border.all(
                        color: AppColors.black,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
