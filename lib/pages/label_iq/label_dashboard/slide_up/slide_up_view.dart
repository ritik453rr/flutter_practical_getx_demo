import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/custom_app_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlideUpView extends StatelessWidget {
  SlideUpView({super.key});
  var segmentedControlGroupValue = 0.obs;

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
                children: [
                  Container(
                    height: 150,
                    width: 400,
                    color: Colors.red,
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Container(
                    height: 150,
                    width: 400,
                    color: Colors.yellow,
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Obx(
                    () => Container(
                      width: Get.width,
                      // height: 90,
                      // color: Colors.yellow,
                      child:
                       CupertinoSlidingSegmentedControl(
                          thumbColor: Colors.green,
                          groupValue: segmentedControlGroupValue.value,
                          children: {
                            0: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Item 0",
                              style: TextStyle(color:
                              
                                segmentedControlGroupValue.value == 0?
                               Colors.white:
                               Colors.black
                              
                              
                              
                              )
                              
                              ),
                            ),
                            1: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Item 1",
                              style: TextStyle(color:
                              
                                segmentedControlGroupValue.value == 1?
                               Colors.white:
                               Colors.black
                              
                              ),
                              ),
                            ),
                          },
                          onValueChanged: (i) {
                            segmentedControlGroupValue.value = i ?? 0;
                          }),
                    ),
                  ),
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

enum Days { Analysis, Ingredients }
