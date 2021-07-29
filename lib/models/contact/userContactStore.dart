import 'package:mobx/mobx.dart';
import 'userContact.dart';

part 'userContactStore.g.dart';

class UserContactStore = _UserContactStore with _$UserContactStore;

abstract class _UserContactStore with Store {
  @observable
  List<UserContact> contacts = [];

  @action
  addUserContact({name, number}) {
    contacts.add(UserContact(name: name, number: number));
  }

  @action
  removeUserContact(pIndex) {
    contacts.removeAt(pIndex);
  }
}
