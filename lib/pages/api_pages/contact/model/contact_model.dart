import 'package:flutter_contacts/contact.dart';
import 'package:get/get.dart';

class ContactModel {
  Contact contact;
  RxBool isSelected;

  ContactModel({required this.contact, bool isSelected = false})
      : isSelected = isSelected.obs;

  /// 🔥 Assign a list of Contacts at once (safe)
  static List<ContactModel> fromContactList(List<Contact> contacts) {
    return contacts.map((c) {
      final safeName = _sanitize(c.displayName);
      c.displayName = safeName;

      return ContactModel(
        contact: c,
      );
    }).toList();
  }

  static String _sanitize(String value) {
    return value.replaceAll(RegExp(r'[\uD800-\uDFFF]'), '').trim();
  }
}
