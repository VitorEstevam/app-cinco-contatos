import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'userContact.dart';

part 'userContactStore.g.dart';

class UserContactStore = _UserContactStore with _$UserContactStore;

abstract class _UserContactStore with Store {
  @observable
  List<UserContact> contacts = [];

  _UserContactStore() {
    loadUserContact();
  }

  @action
  addUserContact({name, number}) {
    contacts.add(UserContact(name: name, number: number));
    saveUserContact();
  }

  @action
  removeUserContact(pIndex) {
    contacts.removeAt(pIndex);
    saveUserContact();
  }

  @action
  loadUserContact() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = prefs.getString("userContacts");
    if (response != null) {
      var list = jsonDecode(response);
      list.forEach((i) => contacts.add(UserContact.fromJson(i)));
    }
  }

  @action
  cleanUserContacts() {
    contacts = [];
    saveUserContact();
  }

  saveUserContact() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userContacts", jsonEncode(contacts));
  }

  removeSavedUserContact() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("userContacts");
  }
}
