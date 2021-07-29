import 'dart:convert';

import 'package:cinco_contatos/models/user.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'userStore.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  User? user;

  _UserStore() {
    loadUser();
  }

  @action
  fakeLogin({pName, pEmail, pPassword}) {
    user = User(name: pName, email: pEmail, password: pPassword);
    saveUser();
  }

  @action
  logout() {
    user = null;
    removeSavedUser();
  }

  @action
  loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = prefs.getString("user");
    if (response != null) user = User.fromJson(jsonDecode(response));
  }

  saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user", jsonEncode(user!.toJson()));
  }

  removeSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("user");
  }
}
