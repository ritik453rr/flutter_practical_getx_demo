import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/global.dart';
import 'package:getx_demo/database/database_quries.dart';
import 'package:getx_demo/database/static_resources.dart';

var onboardPages = [
  commonOnboardView(
    question: StaticResources.onboardQues[0],
    pageNo: 0,
  ),
  commonOnboardView(
    question: StaticResources.onboardQues[1],
    pageNo: 1,
  ),
  commonOnboardView(
    question: StaticResources.onboardQues[2],
    pageNo: 2,
  ),
];

Widget commonOnboardView(
    {required String question, required int pageNo, isOwnProduct = true}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(question),
      Obx(
        () => Flexible(
          child: ListView.builder(
            itemCount: Global.prefOptions
                .where((item) => item.pageNo == pageNo)
                .toList()
                .length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final option = Global.prefOptions
                  .where((item) => item.pageNo == pageNo)
                  .toList()[index];
              return CheckboxListTile(
                  title: Text(option.title),
                  value: option.isSelected,
                  onChanged: (val) async {
                    final updatedOption = option.copyWith(
                      isSelected: val!,
                    );

                    // Update in the database
                    await DatabaseQuries.updatePrefEntity(updatedOption);
                    // Update the local state if needed
                  });
            },
          ),
        ),
      ),
    ],
  );
}
