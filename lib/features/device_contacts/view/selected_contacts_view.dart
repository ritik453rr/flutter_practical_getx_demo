import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:get/get.dart';
import 'package:getx_demo/app_constants.dart';
import 'package:getx_demo/features/device_contacts/controller/app_contact_controller.dart';

/// Displays a grid of selected contacts with avatars and provides navigation to proceed in the onboarding flow.
class SelectedContactsView extends StatelessWidget {
  SelectedContactsView({super.key});

  final controller = Get.find<AppContactController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              /// Header
              const SizedBox(height: 10),

              // 10.h,

              /// Selected Contacts Grid
              Expanded(
                child: Obx(
                  () => GridView.builder(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      mainAxisExtent: 160,
                    ),
                    itemCount: controller.deviceAllContacts
                        .where((Contact c) => c.isSelected.value)
                        .length,
                    itemBuilder: (_, index) {
                      final contact = controller.deviceAllContacts
                          .where((Contact c) => c.isSelected.value)
                          .toList()[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// Avatar
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.12),
                                  blurRadius: 4,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: contact.photoOrThumbnail != null
                                  ? Image.memory(
                                      contact.photoOrThumbnail!,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      color: Colors.blue.shade100,
                                      alignment: Alignment.center,
                                      child: Text(
                                        AppConstants.getInitials(
                                          contact.displayName,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
