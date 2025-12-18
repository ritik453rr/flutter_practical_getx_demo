import 'package:flutter_contacts/contact.dart';
import 'package:get/get.dart';

class ContactModel {
  Contact contact;
  RxBool isSelected;

  ContactModel({required this.contact, bool isSelected = false})
      : isSelected = isSelected.obs;
}
