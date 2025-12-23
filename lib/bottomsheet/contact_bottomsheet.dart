import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_demo/common/common_ui.dart';
import 'package:getx_demo/extension/app_extension.dart';
import 'package:getx_demo/global.dart';
import 'package:getx_demo/pages/api_pages/contact/model/contact_model.dart';
import 'package:getx_demo/pages/api_pages/contact/widgets/contact_widgets.dart';

/// Displays a scrollable GetX bottom sheet for searching, selecting, and continuing with contacts, handling loading and user actions via callbacks.
Future<void> showContactSheet({
  required RxList<ContactModel> filteredContacts,
  void Function(String)? onChangedSearch,
  required RxBool loadingContact,
  void Function()? onTapContinue,
}) {
  return Get.bottomSheet(
    isScrollControlled: true,
    ignoreSafeArea: false,
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
            Obx(
                  () {
                    if (loadingContact.value) {
                      return SizedBox(
                        height: Get.height * 0.5,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    // if (filteredContacts.isEmpty) {
                    //   return SizedBox(
                    //     height: Get.height * 0.4,
                    //     child: Center(
                    //       child: CommonUi.emptyState(
                    //         title: "Not found",
                    //       ),
                    //     ),
                    //   );
                    // }
                    return Expanded(
                      child: AlphabetScrollView(
                        list: filteredContacts
                            .map((e) => AlphaModel(e.contact.displayName))
                            .toList(),
                        // itemExtent: 72,
                      
                        selectedTextStyle: TextStyle(color: Colors.red),
                        unselectedTextStyle: TextStyle(color: Colors.black),
                        itemBuilder: (_, index, id) {
                          final contact = filteredContacts[index];
                          final disname = AppConstants.getInitials(
                              contact.contact.displayName);
                      
                          return disname.isEmpty
                              ? SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          contact.isSelected.value =
                                              !contact.isSelected.value;
                                        },
                                        child: Obx(
                                          () => Container(
                                            height: 24,
                                            width: 24,
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
                                      const SizedBox(width: 12),
                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: contactAvatar(
                                          name:
                                              disname, //contact.contact.displayName,
                                          image:
                                              contact.contact.photoOrThumbnail !=
                                                      null
                                                  ? MemoryImage(contact
                                                      .contact.photoOrThumbnail!)
                                                  : null,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                      
                                      /// Contact Name
                                      Expanded(
                                        child: Text(
                                          contact.contact.displayName,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                        },
                      ),
                    );
                  },
                ),
            
            // handler
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 10),
            //   width: 40,
            //   height: 4,
            //   decoration: BoxDecoration(
            //     color: Colors.grey.shade300,
            //     borderRadius: BorderRadius.circular(4),
            //   ),
            // ),
            // // Selected Count
            // Obx(() {
            //   return Text(
            //     "show selected (${filteredContacts.where((ContactModel c) => c.isSelected.value).length})",
            //     style: const TextStyle(
            //       color: Colors.blue,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   );
            // }),
            // 10.h,
            // // Back button row
            // Padding(
            //   padding: const EdgeInsets.only(left: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       GestureDetector(
            //         behavior: HitTestBehavior.translucent,
            //         onTap: () {
            //           Get.back();
            //         },
            //         child: Container(
            //           height: 45,
            //           width: 45,
            //           alignment: Alignment.center,
            //           decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: Colors.white,
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.black.withOpacity(0.15),
            //                 blurRadius: 8,
            //                 spreadRadius: 1,
            //                 offset: const Offset(0, 4), // shadow position
            //               ),
            //             ],
            //           ),
            //           child: Icon(Icons.keyboard_arrow_left),
            //         ),
            //       ),
            //       Text(
            //         "Contacts",
            //         style: TextStyle(
            //             fontSize: 18, fontWeight: FontWeight.bold),
            //       ),
            //       const Text(
            //         "Contacts",
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.transparent,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // 10.h,
            // Search Field
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(30),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black.withValues(alpha: 0.08),
            //           blurRadius: 8,
            //           spreadRadius: 1,
            //           offset: const Offset(0, 3),
            //         ),
            //       ],
            //     ),
            //     child: TextField(
            //       onChanged: onChangedSearch,
            //       decoration: InputDecoration(
            //         prefixIcon: const Icon(Icons.search),
            //         hintText: "Search",
            //         filled: true,
            //         fillColor: Colors.white,
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(30),
            //           borderSide: BorderSide.none,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Column(
            //   children: [
            //     /// Contact List
            //     Obx(
            //       () {
            //         if (loadingContact.value) {
            //           return SizedBox(
            //             height: Get.height * 0.5,
            //             child: const Center(
            //               child: CircularProgressIndicator(),
            //             ),
            //           );
            //         }
            //         // if (filteredContacts.isEmpty) {
            //         //   return SizedBox(
            //         //     height: Get.height * 0.4,
            //         //     child: Center(
            //         //       child: CommonUi.emptyState(
            //         //         title: "Not found",
            //         //       ),
            //         //     ),
            //         //   );
            //         // }
            //         return AlphabetScrollView(
            //           list: filteredContacts
            //               .map((e) => AlphaModel(e.contact.displayName))
            //               .toList(),
            //           // itemExtent: 72,
                    
            //           selectedTextStyle: TextStyle(color: Colors.red),
            //           unselectedTextStyle: TextStyle(color: Colors.black),
            //           itemBuilder: (_, index, id) {
            //             final contact = filteredContacts[index];
            //             final disname = AppConstants.getInitials(
            //                 contact.contact.displayName);
                    
            //             return disname.isEmpty
            //                 ? SizedBox()
            //                 : Padding(
            //                     padding: const EdgeInsets.only(bottom: 14),
            //                     child: Row(
            //                       children: [
            //                         GestureDetector(
            //                           behavior: HitTestBehavior.translucent,
            //                           onTap: () {
            //                             contact.isSelected.value =
            //                                 !contact.isSelected.value;
            //                           },
            //                           child: Obx(
            //                             () => Container(
            //                               height: 24,
            //                               width: 24,
            //                               decoration: BoxDecoration(
            //                                 shape: BoxShape.circle,
            //                                 border: Border.all(
            //                                   color: contact.isSelected.value
            //                                       ? Colors.blue
            //                                       : Colors.grey.shade400,
            //                                   width: 2,
            //                                 ),
            //                                 color: contact.isSelected.value
            //                                     ? Colors.blue
            //                                     : Colors.transparent,
            //                               ),
            //                               child: contact.isSelected.value
            //                                   ? const Icon(
            //                                       Icons.check,
            //                                       size: 16,
            //                                       color: Colors.white,
            //                                     )
            //                                   : null,
            //                             ),
            //                           ),
            //                         ),
            //                         const SizedBox(width: 12),
            //                         SizedBox(
            //                           height: 40,
            //                           width: 40,
            //                           child: contactAvatar(
            //                             name:
            //                                 disname, //contact.contact.displayName,
            //                             image:
            //                                 contact.contact.photoOrThumbnail !=
            //                                         null
            //                                     ? MemoryImage(contact
            //                                         .contact.photoOrThumbnail!)
            //                                     : null,
            //                           ),
            //                         ),
            //                         const SizedBox(width: 12),
                    
            //                         /// Contact Name
            //                         Expanded(
            //                           child: Text(
            //                             contact.contact.displayName,
            //                             style: const TextStyle(fontSize: 16),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   );
            //           },
            //         );
            //       },
            //     ),
            
            //     // ListView.builder(
            //     //   shrinkWrap: true,
            //     //   physics: NeverScrollableScrollPhysics(),
            //     //   padding: EdgeInsets.only(
            //     //     bottom: 20,
            //     //     left: 20,
            //     //     top: 20,
            //     //   ),
            //     //   itemCount: filteredContacts.length,
            //     //   itemBuilder: (context, index) {
            //     // final contact = filteredContacts[index];
            //     // final disname = AppConstants.getInitials(
            //     //     contact.allContacts.displayName);
            
            //     //     return disname.isEmpty
            //     //         ? SizedBox()
            //     //         : Padding(
            //     //             padding:
            //     //                 const EdgeInsets.only(bottom: 14),
            //     //             child: Row(
            //     //               children: [
            //     //                 GestureDetector(
            //     //                   behavior:
            //     //                       HitTestBehavior.translucent,
            //     //                   onTap: () {
            //     //                     contact.isSelected.value =
            //     //                         !contact.isSelected.value;
            //     //                   },
            //     //                   child: Obx(
            //     //                     () => Container(
            //     //                       height: 24,
            //     //                       width: 24,
            //     //                       decoration: BoxDecoration(
            //     //                         shape: BoxShape.circle,
            //     //                         border: Border.all(
            //     //                           color: contact
            //     //                                   .isSelected.value
            //     //                               ? Colors.blue
            //     //                               : Colors.grey.shade400,
            //     //                           width: 2,
            //     //                         ),
            //     //                         color:
            //     //                             contact.isSelected.value
            //     //                                 ? Colors.blue
            //     //                                 : Colors.transparent,
            //     //                       ),
            //     //                       child: contact.isSelected.value
            //     //                           ? const Icon(
            //     //                               Icons.check,
            //     //                               size: 16,
            //     //                               color: Colors.white,
            //     //                             )
            //     //                           : null,
            //     //                     ),
            //     //                   ),
            //     //                 ),
            //     //                 const SizedBox(width: 12),
            //     //                 SizedBox(
            //     //                   height: 40,
            //     //                   width: 40,
            //     //                   child: contactAvatar(
            //     //                     name:
            //     //                         disname, //contact.contact.displayName,
            //     //                     image: contact.allContacts
            //     //                                 .photoOrThumbnail !=
            //     //                             null
            //     //                         ? MemoryImage(contact
            //     //                             .allContacts
            //     //                             .photoOrThumbnail!)
            //     //                         : null,
            //     //                   ),
            //     //                 ),
            //     //                 const SizedBox(width: 12),
            
            //     //                 /// Contact Name
            //     //                 Expanded(
            //     //                   child: Text(
            //     //                     contact.allContacts.displayName,
            //     //                     style:
            //     //                         const TextStyle(fontSize: 16),
            //     //                   ),
            //     //                 ),
            //     //               ],
            //     //             ),
            //     //           );
            //     //   },
            //     // );
            
            //     // }),
            //   ],
            // ),
            
            // GestureDetector(
            //   behavior: HitTestBehavior.translucent,
            //   onTap: () {
            //     onTapContinue?.call();
            //   },
            //   child: Container(
            //     width: double.infinity,
            //     height: 52,
            //     margin: EdgeInsets.symmetric(horizontal: 20),
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       color: const Color(0xFF1A73E8), // iOS blue
            //       borderRadius: BorderRadius.circular(26),
            //     ),
            //     child: Text(
            //       "Continue",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 16,
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 12),
            // GestureDetector(
            //   behavior: HitTestBehavior.translucent,
            //   onTap: () {
            //     // AppConstants.hideKeyboard();
            //     // Get.back();
            //     // Get.offNamed(AppRoutes.syncContactIntro);
            //   },
            //   child: Container(
            //     width: double.infinity,
            //     height: 52,
            //     margin: EdgeInsets.symmetric(horizontal: 20),
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(26),
            //     ),
            //     child: Text(
            //       "Later",
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 15,
            //         fontWeight: FontWeight.w500,
            //       ),
            //     ),
            //   ),
            // ),
            // AppConstants.bottomSpace.h,
          ],
        ),
      ),
    ),
  );
}
