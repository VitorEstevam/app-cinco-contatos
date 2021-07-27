import 'package:cinco_contatos/models/userStore.dart';
import 'package:test/test.dart';

void main() {
  UserStore store = UserStore();

  test('checks if we can register a user', () {
    var response = store.registerUser(
        pName: "vitor", pEmail: "vitor@mail.com", pPassword: "12345");
    expect(store.isEmailInRegisteredUsers("vitor@mail.com"), equals(true));
  });

  test('checks if we can do login', () {
    var response = store.login(pEmail: "vitor@mail.com", pPassword: "12345");
    expect(store.user != null, equals(true));
  });
}
