import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/app_constants.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/extension/app_extension.dart';
import 'package:getx_demo/features/contact/controller/app_contact_controller.dart';
import 'package:getx_demo/features/contact/widgets/contact_widgets.dart';

class ContactAvatarView extends StatelessWidget {
  ContactAvatarView({super.key});

  final controller = Get.find<AppContactController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF2F2F3,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
          child: SizedBox(
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.h,
                // CommonUi.circleBackBtn(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          return controller.isLoadingDeviceContacts.value
                              ? SizedBox(
                                  height: Get.height * 0.75,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : controller.deviceAllContacts.isEmpty
                                  ? SizedBox(
                                      height: Get.height * 0.75,
                                      child: CommonUi.emptyState(
                                        title: "Not able to fetch contacts",
                                      ),
                                    )
                                  : GridView.builder(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 7,
                                        mainAxisSpacing: 12,
                                        crossAxisSpacing: 12,
                                      ),
                                      itemCount:
                                          controller.deviceAllContacts.length,
                                      itemBuilder: (context, index) {
                                        final contact =
                                            controller.deviceAllContacts[index];
                                        return contactAvatar(
                                          name: contact.displayName,
                                          image:
                                              contact.photoOrThumbnail != null
                                                  ? MemoryImage(
                                                      contact.photoOrThumbnail!,
                                                    )
                                                  : null,
                                        );
                                      },
                                    );
                        }),
                      ],
                    ),
                  ),
                ),
                // Obx(() {
                //   return appButton(
                //     loading: controller.contactSyncingWithDB,
                //     enable: controller.deviceAllContacts.isEmpty
                //         ? false.obs
                //         : true.obs,
                //     title: StringConstants.kNextCap.tr,
                //     onTap: () {
                //       // controller.checkNotyPermissionAndProceed();
                //       controller.syncContactWithDatabase();
                //     },
                //   );
                // }),
                AppConstants.bottomSpace.h,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
