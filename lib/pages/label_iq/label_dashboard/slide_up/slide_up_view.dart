import 'package:chip_list/chip_list.dart';
import 'package:circular_progress_stack/circular_progress_stack.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_fonts.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/common/custom_app_bar.dart';
import 'package:getx_demo/pages/label_iq/label_dashboard/slide_up/slide_up_controller.dart';
import 'package:getx_demo/pages/label_iq/label_dashboard/slide_up/widgets_slideup.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlideUpView extends StatelessWidget {
  SlideUpView({super.key});

  final controller = Get.find<SlideUpController>();
  final List<String> names = [
    "Ritik Dhiman",
    "Vashu",
    "Harshit",
    "Shivek Kamboj",
    // "Rahul",
    // "Vivek",
    // "Prakhar"
  ];

  // var currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.black,
      appBar: customAppBar(
          title: "Slide Up View", backgroundColor: Colors.transparent),
      body: ColorfulSafeArea(
        top: false,
        color: Colors.black54,
        child: SlidingUpPanel(
            padding: EdgeInsets.symmetric(horizontal: 20),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            minHeight: Get.height - 180,
            maxHeight: Get.height - 150,
            panel: SingleChildScrollView(
              padding: EdgeInsets.only(top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        AnimatedStackCircularProgressBar(
                          size: 270,
                          progressStrokeWidth: 10,
                          backStrokeWidth: 10,
                          startAngle: 0,
                          backColor: const Color(0xffD7DEE7),
                          bars: [
                            AnimatedBarValue(
                              barColor: Colors.green,
                              barValues: 75,
                              fullProgressColors: Colors.red,
                            ),
                            AnimatedBarValue(
                              barColor: Colors.orange,
                              barValues: 60,
                              fullProgressColors: Colors.red,
                            ),
                            AnimatedBarValue(
                              barColor: Colors.yellow,
                              barValues: 50,
                              fullProgressColors: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    height: 150,
                    width: 400,
                    color: Colors.yellow,
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Obx(
                    () => SizedBox(
                      width: Get.width,
                      child: CupertinoSlidingSegmentedControl(
                          thumbColor: Colors.green,
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          groupValue: controller.tabIndex.value,
                          children: {
                            0: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Item 0",
                                  style: TextStyle(
                                      color: controller.tabIndex.value == 0
                                          ? Colors.white
                                          : Colors.black)),
                            ),
                            1: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Item 1",
                                style: TextStyle(
                                    color: controller.tabIndex.value == 1
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          },
                          onValueChanged: (i) {
                            controller.tabIndex.value = i ?? 0;
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Obx(() {
                    return controller.tabIndex.value == 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Allergen",
                                style: CommonUi.customTextStyle(
                                    fontSize: 18,
                                    fontFamily: AppFonts.semiBold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: names.map((option) {
                                  return Chip(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    color: WidgetStatePropertyAll(
                                      Colors.grey.withOpacity(0.5),
                                    ),
                                    visualDensity: VisualDensity.compact,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 10),
                                    side: BorderSide(color: Colors.transparent),
                                    label: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.person,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          option,
                                          style: CommonUi.customTextStyle(
                                              color: Colors.black,
                                              fontFamily: AppFonts.semiBold),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                "Options",
                                style: CommonUi.customTextStyle(
                                    fontSize: 18,
                                    fontFamily: AppFonts.semiBold),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              optionList(),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          )
                        :

                        /// ingredients tab view
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ingredients",
                                style: CommonUi.customTextStyle(
                                    fontSize: 18,
                                    fontFamily: AppFonts.semiBold),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              ListView.builder(
                                  itemCount: controller.ingredientList.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(bottom: 24),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var item = controller.ingredientList[index];
                                    return ExpansionTile(
                                      tilePadding: EdgeInsets.zero,
                                      maintainState: true,
                                      collapsedShape: Border(),
                                      childrenPadding: EdgeInsets.zero,
                                      // dense: true,
                                      // visualDensity: VisualDensity.compact,
                                      // controller: controller.expTileController,
                                      expandedAlignment: Alignment.centerLeft,
                                      leading: const Icon(
                                        Icons.water_drop,
                                        color: Colors.green,
                                      ),
                                      title: Text(
                                        "Water",
                                        style: CommonUi.customTextStyle(
                                          fontFamily: AppFonts.semiBold,
                                          fontSize: 16,
                                        ),
                                      ),

                                      shape: const RoundedRectangleBorder(
                                          side: BorderSide.none),

                                      onExpansionChanged: (val) {
                                        item.isExpand.value = val;
                                      },
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "~60%",
                                            style: CommonUi.customTextStyle(
                                              fontFamily: AppFonts.semiBold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Obx(() {
                                            return item.isExpand.value
                                                ? Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 18,
                                                  )
                                                : Icon(
                                                    Icons.arrow_back_ios,
                                                    size: 18,
                                                  );
                                          }),
                                        ],
                                      ),

                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 80,
                                                ),
                                                child: Text(
                                                    "Used as a base for sorber. No known risks."),
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 50,
                                              decoration:
                                                  CommonUi.roundBoxDecoration(
                                                      borderRadius: 16,
                                                      color: Colors.grey[400]!),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  }),
                              Text(
                                "Options",
                                style: CommonUi.customTextStyle(
                                    fontSize: 18,
                                    fontFamily: AppFonts.semiBold),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              optionList(),
                              SizedBox(
                                height: 80,
                              ),
                            ],
                          );
                  }),
                ],
              ),
            ),
            body: Container(
              color: Colors.yellow,
            )),
      ),
    );
  }
}
