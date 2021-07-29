import 'package:cinco_contatos/models/contact/userContactStore.dart';
import 'package:cinco_contatos/models/userStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class NewContactComponent extends StatefulWidget {
  const NewContactComponent({Key? key}) : super(key: key);

  @override
  _NewContactComponentState createState() => _NewContactComponentState();
}

class _NewContactComponentState extends State<NewContactComponent> {
  bool permission = false;

  @override
  void initState() {
    askForPermission();

    super.initState();
  }

  askForPermission() async {
    await FlutterContacts.requestPermission();
    if (await FlutterContacts.requestPermission()) {
      setState(() => permission = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !permission
          ? Container()
          : Scaffold(
              body: Observer(builder: (context) {
                return Container(
                    child: Text(
                        context.watch<UserContactStore>().contacts.toString()));
              }),
              floatingActionButton: FloatingActionButton(
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
                onPressed: () async {
                  var _contact = await FlutterContacts.openExternalPick();
                  if (_contact == null) return;

                  setState(() {
                    context.read<UserContactStore>().addUserContact(
                        name: _contact.displayName,
                        number: _contact.phones[0].number);
                  });
                },
              ),
            ),
    );
  }
}
