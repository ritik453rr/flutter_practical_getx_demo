import 'package:flutter/foundation.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo/Dialog/app_adaptive_dialog.dart';
import 'package:getx_demo/bottomsheet/contact_bottomsheet.dart';
import 'package:getx_demo/pages/api_pages/contact/model/contact_model.dart';
import 'package:permission_handler/permission_handler.dart';

class AppContactController extends GetxController {
  var isLoading = false.obs;
  var contacts = <ContactModel>[].obs;

  /// Selected contacts
  var filteredContacts = <ContactModel>[].obs;
  // var searchQuery = ''.obs;
  final letterIndexMap = <String, int>{}.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // ever(searchQuery, (_) => applySearch());
  }

  void buildLetterIndex() {
    letterIndexMap.clear();

    for (int i = 0; i < filteredContacts.length; i++) {
      final name = filteredContacts[i].contact.displayName;
      if (name.isEmpty) continue;

      final letter = name[0].toUpperCase();
      if (!letterIndexMap.containsKey(letter)) {
        letterIndexMap[letter] = i;
      }
    }
  }

  void applySearch(String searchQuery) {
    if (searchQuery.isEmpty) {
      filteredContacts.assignAll(contacts);
    } else {
      filteredContacts.assignAll(
        contacts.where((c) => c.contact.displayName
            .toLowerCase()
            .contains(searchQuery.toLowerCase())),
      );
    }
    buildLetterIndex();
  }

  void ensureContactsPermission({isSelect = false}) async {
    final contactPermission = Permission.contacts.status;
    if (await contactPermission.isDenied) {
      await Permission.contacts.request();
      if (await contactPermission.isGranted) {
        loadContacts(isSelected: isSelect);
      }
    } else if (await contactPermission.isPermanentlyDenied) {
      appAdaptiveDialog(
          content: "Allow contact permission",
          firstBtnText: "cancel",
          secondBtnText: "Opne Settings",
          onTapSecondBtn: () {
            openAppSettings();
            Get.back();
          });
    } else {
      loadContacts(isSelected: isSelect);
    }
  }

  Future<void> loadContacts({isSelected = false}) async {
    try {
      if (isSelected) {
        showContactSheet(
          filteredContacts: filteredContacts,
          loadingContact: isLoading,
          onChangedSearch: (value) => applySearch(value.trim()),
        );
      } else {}
      isLoading.value = true;
      final List<Contact> conts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: true,
        withThumbnail: true,
        sorted: true,
      );
      contacts.value = ContactModel.fromContactList(conts);
      filteredContacts.assignAll(contacts);
      buildLetterIndex();
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }
}
