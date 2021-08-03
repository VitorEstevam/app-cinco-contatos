import 'package:cinco_contatos/models/contact/userContactStore.dart';
import 'package:cinco_contatos/models/user/userStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'list_contacts.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
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
    print(context.read<UserContactStore>().contacts);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title:
            Text("Cinco contatos de ${context.read<UserStore>().user!.name}"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<UserStore>().logout();
                context.read<UserContactStore>().cleanUserContacts();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: !permission
          ? Container()
          : Stack(
              children: [
                ListContacts(),
                Positioned(
                  bottom: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                              child: Icon(
                                Icons.dialpad,
                                size: 30,
                              ),
                              onPressed: () => launch("tel://")),
                          FloatingActionButton(
                            child: Icon(
                              Icons.add,
                              size: 30,
                            ),
                            onPressed: () async {
                              var _contact =
                                  await FlutterContacts.openExternalPick();
                              if (_contact == null) return;

                              setState(() {
                                context.read<UserContactStore>().addUserContact(
                                    name: _contact.displayName,
                                    number: _contact.phones[0].number);
                              });
                            },
                          ),
                        ]),
                  ),
                )
              ],
            ),
    );
  }
}
