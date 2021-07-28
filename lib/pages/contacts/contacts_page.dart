import 'package:cinco_contatos/models/userStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ),
        body: TabBarView(
          children: [
            Builder(
                builder: (context) => Container(
                        child: Center(
                      child: Text(
                          context.watch<UserStore>().user!.toJson().toString()),
                    ))),
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
