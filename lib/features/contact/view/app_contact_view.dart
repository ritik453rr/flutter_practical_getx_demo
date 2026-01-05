import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/features/contact/controller/app_contact_controller.dart';

class AppContactView extends StatelessWidget {
  AppContactView({super.key});

  final controller = Get.find<AppContactController>();
  final ScrollController scrollController = ScrollController();

  final List<String> alphabets =
      List.generate(26, (i) => String.fromCharCode(65 + i));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contacts"),
          centerTitle: true,
          // actions: [
          //   Obx(
          //     () => TextButton(
          //       onPressed: controller.selectedContacts.isEmpty
          //           ? null
          //           : () {
          //               // Done action
          //               debugPrint(
          //                   "Selected: ${controller.selectedContacts.length}");
          //             },
          //       child: const Text(
          //         "Done",
          //         style: TextStyle(fontSize: 16),
          //       ),
          //     ),
          //   ),
          // ],
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
                onPressed: (){
                  controller.ensureContactsPermission();
                },
                child: Text("Sync all")),
            TextButton(
                onPressed: () {
                  controller.ensureContactsPermission(isSelect: true);
                },
                child: Text("Select contact")),
          ]),
        )

        //  Obx(() {
        //   if (controller.isLoading.value) {
        //     return const Center(child: CircularProgressIndicator());
        //   }

        //   if (controller.contacts.isEmpty) {
        //     return Center(
        //       child: TextButton(
        //         onPressed: controller.ensureContactsPermission,
        //         child: const Text("Sync Contacts"),
        //       ),
        //     );
        //   }

        //   return Stack(
        //     children: [
        //       Column(
        //         children: [
        //           /// 🔍 Search Bar
        //           Padding(
        //             padding: const EdgeInsets.all(12),
        //             child: TextField(
        //               onChanged: (value) => controller.searchQuery.value = value,
        //               decoration: InputDecoration(
        //                 prefixIcon: const Icon(Icons.search),
        //                 hintText: "Search",
        //                 filled: true,
        //                 fillColor: Colors.grey.shade200,
        //                 border: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(10),
        //                   borderSide: BorderSide.none,
        //                 ),
        //               ),
        //             ),
        //           ),

        //           /// 📋 Contact List
        //           Expanded(
        //             child: ListView.builder(
        //               controller: scrollController,
        //               itemCount: controller.filteredContacts.length,
        //               itemBuilder: (context, index) {
        //                 final contact = controller.filteredContacts[index];
        //                 // final isSelected = controller.isSelected(contact.contact);

        //                 return Container(
        //                   padding: const EdgeInsets.symmetric(
        //                       horizontal: 16, vertical: 12),
        //                   child: Row(
        //                     children: [
        //                       /// Selection Circle
        //                       GestureDetector(
        //                         onTap: () {
        //                           // controller.toggleSelection(contact);
        //                           contact.isSelected.value = !contact.isSelected.value;
        //                         },
        //                         child: Obx(()=>Container(
        //                           height: 24,
        //                           width: 24,
        //                           decoration: BoxDecoration(
        //                             shape: BoxShape.circle,
        //                             border: Border.all(
        //                               color: contact.isSelected.value
        //                                   ? Colors.blue
        //                                   : Colors.grey.shade400,
        //                               width: 2,
        //                             ),
        //                             color: contact.isSelected.value
        //                                 ? Colors.blue
        //                                 : Colors.transparent,
        //                           ),
        //                           child: contact.isSelected.value
        //                               ? const Icon(Icons.check,
        //                                   size: 16, color: Colors.white)
        //                               : null,
        //                         ),
        //                       ),),
        //                       const SizedBox(width: 12),

        //                       /// Contact Name
        //                       Expanded(
        //                         child: Text(
        //                           contact.contact.displayName,
        //                           style: const TextStyle(fontSize: 16),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 );
        //               },
        //             ),
        //           ),
        //         ],
        //       ),

        //       /// 🔤 Right Alphabet Index
        //       Positioned(
        //         right: 6,
        //         top: 120,
        //         bottom: 20,
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: alphabets.map((letter) {
        //             return GestureDetector(
        //               onTap: () {
        //                 final index = controller.letterIndexMap[letter];
        //                 if (index != null) {
        //                   scrollController.jumpTo(index * 56.0);
        //                 }
        //               },
        //               child: Padding(
        //                 padding: const EdgeInsets.symmetric(vertical: 2),
        //                 child: Text(
        //                   letter,
        //                   style: const TextStyle(
        //                     fontSize: 12,
        //                     color: Colors.blue,
        //                   ),
        //                 ),
        //               ),
        //             );
        //           }).toList(),
        //         ),
        //       ),
        //     ],
        //   );
        // }),

        );
  }
}
