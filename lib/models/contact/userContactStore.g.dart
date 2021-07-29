// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userContactStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserContactStore on _UserContactStore, Store {
  final _$contactsAtom = Atom(name: '_UserContactStore.contacts');

  @override
  List<UserContact> get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(List<UserContact> value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  final _$_UserContactStoreActionController =
      ActionController(name: '_UserContactStore');

  @override
  dynamic addUserContact({dynamic name, dynamic number}) {
    final _$actionInfo = _$_UserContactStoreActionController.startAction(
        name: '_UserContactStore.addUserContact');
    try {
      return super.addUserContact(name: name, number: number);
    } finally {
      _$_UserContactStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeUserContact(dynamic pIndex) {
    final _$actionInfo = _$_UserContactStoreActionController.startAction(
        name: '_UserContactStore.removeUserContact');
    try {
      return super.removeUserContact(pIndex);
    } finally {
      _$_UserContactStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contacts: ${contacts}
    ''';
  }
}
