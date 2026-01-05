import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo/Dialog/app_adaptive_dialog.dart';
import 'package:getx_demo/bottomsheet/contact_bottomsheet.dart';
import 'package:getx_demo/routing/app_routes.dart';
import 'package:permission_handler/permission_handler.dart';

class AppContactController extends GetxController {
  var isLoadingDeviceContacts = false.obs;
  var deviceAllContacts = <Contact>[].obs;
  var deviceFilteredContacts = <Contact>[].obs;

  /// Filters contacts based on the search query.
  void applySearch(String searchQuery) {
    if (searchQuery.isEmpty) {
      deviceFilteredContacts.assignAll(deviceAllContacts);
    } else {
      deviceFilteredContacts.assignAll(
        deviceAllContacts.where((c) =>
            c.displayName.toLowerCase().contains(searchQuery.toLowerCase())),
      );
    }
  }

  /// Ensures that the app has permission to access contacts.
  void ensureContactsPermission({isSelect = false}) async {
    final contactPermission = Permission.contacts.status;
    if (await contactPermission.isDenied) {
      final status = await Permission.contacts.request();
      if (status.isGranted) {
        loadDeviceContacts(isSelected: isSelect);
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
      loadDeviceContacts(isSelected: isSelect);
    }
  }

  /// Loads contacts from the device and optionally shows the contact selection sheet.
  Future<void> loadDeviceContacts({isSelected = false}) async {
    try {
      if (isSelected) {
        showContactSheet(
          filteredContacts: deviceFilteredContacts,
          loadingContact: isLoadingDeviceContacts,
          onChangedSearch: (value) => applySearch(value.trim()),
        );
      } else {
        Get.toNamed(AppRoutes.contactAvatar);
      }
      isLoadingDeviceContacts.value = true;
      final List<Contact> conts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: true,
        withThumbnail: true,
        sorted: true,
      );
      deviceAllContacts.value = conts
      .where((item) {
        return item.displayName.isNotEmpty && item.phones.isNotEmpty;
      }).toList();
      deviceFilteredContacts.assignAll(deviceAllContacts);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingDeviceContacts.value = false;
    }
  }
}
