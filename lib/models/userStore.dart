import 'package:cinco_contatos/models/user.dart';
import 'package:mobx/mobx.dart';
part 'userStore.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  User? user;
  List<Map> registeredUsers = [];

  isEmailInRegisteredUsers(pEmail) {
    return registeredUsers
        .map((user) => user["email"])
        .toList()
        .contains(pEmail);
  }

  passwordMatches(pMapUser, pPassword) {
    return pMapUser["password"] == pPassword;
  }

  registerUser({pName, pEmail, pPassword}) {
    if (!isEmailInRegisteredUsers(pEmail)) {
      var _user = new User(name: pName, email: pEmail, password: pPassword);
      registeredUsers.add(_user.toJson());

      return true;
    }
    return false;
  }

  login({pEmail, pPassword}) {
    if (isEmailInRegisteredUsers(pEmail)) {
      Map<String, dynamic> _user =
          registeredUsers.firstWhere((user) => user["email"] == pEmail)
              as Map<String, dynamic>;

      if (passwordMatches(_user, pPassword)) {
        user = User.fromJson(_user);
      }

      return true;
    }
    return false;
  }
}
