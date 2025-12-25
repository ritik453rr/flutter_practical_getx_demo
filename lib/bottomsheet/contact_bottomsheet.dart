import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/extension/app_extension.dart';
import 'package:getx_demo/app_constants.dart';
import 'package:getx_demo/pages/api_pages/contact/model/contact_model.dart';
import 'package:getx_demo/pages/api_pages/contact/widgets/contact_widgets.dart';
import 'package:alphabet_list_view/alphabet_list_view.dart';

List<AlphabetListViewItemGroup> groupContacts(
  List<ContactModel> contacts,
) {
  final Map<String, List<Widget>> map = {};

  for (final contact in contacts) {
    final name = contact.contact.displayName.trim();
    if (name.isEmpty) continue;

    final key = name[0].toUpperCase();

    map.putIfAbsent(key, () => []);

    map[key]!.add(
      ContactListItem(
        contact: contact,
        isFirst: contact == contacts[0],
        isLast: contact == contacts[contacts.length - 1],
      ), // 👈 widget
    );
  }

  final sortedKeys = map.keys.toList()..sort();

  return sortedKeys
      .map(
        (key) => AlphabetListViewItemGroup(
          tag: key,
          children: map[key]!,
        ),
      )
      .toList();
}

class ContactListItem extends StatelessWidget {
  final ContactModel contact;
  final bool isFirst;
  final bool isLast;
  const ContactListItem(
      {super.key,
      required this.contact,
      required this.isFirst,
      required this.isLast});
  @override
  Widget build(BuildContext context) {
    final initials = AppConstants.getInitials(
      contact.contact.displayName,
    );

    return Padding(
      padding: EdgeInsets.only(
        bottom: isLast ? 20 : 14,
        top: isFirst ? 20 : 0,
      ),
      child: Row(
        children: [
          /// Selection
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              AppConstants.hapticFeedBack();
              contact.isSelected.value = !contact.isSelected.value;
            },
            child: Obx(
              () => Container(
                height: 24,
                width: 24,
                margin: const EdgeInsets.only(right: 12, left: 20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: contact.isSelected.value
                        ? Colors.blue
                        : Colors.grey.shade400,
                    width: 2,
                  ),
                  color: contact.isSelected.value
                      ? Colors.blue
                      : Colors.transparent,
                ),
                child: contact.isSelected.value
                    ? const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
          ),
          // const SizedBox(width: 12),

          /// Avatar
          SizedBox(
            height: 40,
            width: 40,
            child: contactAvatar(
              name: initials,
              image: contact.contact.photoOrThumbnail != null
                  ? MemoryImage(
                      contact.contact.photoOrThumbnail!,
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 12),

          /// Name
          Expanded(
            child: Text(
              contact.contact.displayName,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> showContactSheet({
  required RxList<ContactModel> filteredContacts,
  void Function(String)? onChangedSearch,
  required RxBool loadingContact,
  void Function()? onTapContinue,
  void Function()? onTapSelectLater,
}) {
  return Get.bottomSheet(
    isScrollControlled: true,
    ignoreSafeArea: false,
    enableDrag: false,
    SafeArea(
      top: false,
      child: Container(
        width: Get.width,
        height: Get.height * 0.9,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.95),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            /// Drag Handle
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 10),
            //   width: 40,
            //   height: 4,
            //   decoration: BoxDecoration(
            //     color: Colors.grey.shade300,
            //     borderRadius: BorderRadius.circular(4),
            //   ),
            // ),

            10.h,

            /// Selected Count
            Obx(
              () => Text(
                'Selected'
                '(${filteredContacts.where((c) => c.isSelected.value).length})',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            10.h,

            /// Back button Header Row
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: Get.back,
                    child: Container(
                      height: 45,
                      width: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 8,
                            spreadRadius: 1,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.keyboard_arrow_left),
                    ),
                  ),
                  const Text(
                    "Contacts",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Contacts',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),

            10.h,

            /// Search Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: onChangedSearch,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search",
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            /// Contacts List
            Expanded(
              child: Obx(() {
                if (loadingContact.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (filteredContacts.isEmpty) {
                  return Center(
                    child: CommonUi.emptyState(title: "Not Found"),
                  );
                }

                return AlphabetListView(
                  items: groupContacts(filteredContacts),
                  options: AlphabetListViewOptions(
                      scrollbarOptions: ScrollbarOptions(
                        width: 30,
                        symbolBuilder: (context, symbol, state) {
                          var s = state;
                          return Text(
                            symbol,
                            style: TextStyle(
                                color: s.name == 'deactivated'
                                    ? Colors.grey
                                    : Colors.blue),
                          );
                        },
                      ),
                      overlayOptions: OverlayOptions(
                        alignment: Alignment.centerRight,
                        overlayBuilder: (context, symbol) {
                          return Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              symbol,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                      listOptions: const ListOptions(
                        // padding: EdgeInsets.only(top: 20, bottom: 20),
                        showSectionHeader: false,
                      )),
                );
              }),
            ),

            /// Continue Button
            GestureDetector(
              onTap: onTapContinue,
              child: Container(
                width: double.infinity,
                height: 52,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A73E8),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// Select Contact Later
            GestureDetector(
              onTap: onTapSelectLater,
              child: Container(
                width: double.infinity,
                height: 52,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: const Text(
                  "Later",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            AppConstants.bottomSpace.h,
          ],
        ),
      ),
    ),
  );
}
