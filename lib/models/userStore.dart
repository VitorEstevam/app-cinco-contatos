import 'package:cinco_contatos/models/user.dart';
import 'package:mobx/mobx.dart';
part 'userStore.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  User? user;

  @action
  fakeLogin({pName, pEmail, pPassword}) {
    user = User(name: pName, email: pEmail, password: pPassword);
  }
}
