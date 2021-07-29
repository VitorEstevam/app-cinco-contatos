import 'package:cinco_contatos/models/userStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'new_contact_component.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Cinco contatos'),
          actions: [
            IconButton(
                onPressed: context.read<UserStore>().logout,
                icon: Icon(Icons.logout))
          ],
        ),
        body: TabBarView(
          children: [
            Builder(builder: (context) => NewContactComponent()),
            Builder(builder: (context) => Container()),
          ],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).primaryColor,
          child: const TabBar(
            tabs: [
              Tab(icon: Text("My contacts")),
              Tab(icon: Text("Add contact")),
            ],
          ),
        ),
      ),
    );
  }
}
