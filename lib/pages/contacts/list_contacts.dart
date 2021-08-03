import 'dart:math';

import 'package:cinco_contatos/models/contact/userContactStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ListContacts extends StatefulWidget {
  const ListContacts({Key? key}) : super(key: key);

  @override
  _ListContactsState createState() => _ListContactsState();
}

class _ListContactsState extends State<ListContacts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(builder: (context) {
        var items = context.read<UserContactStore>().contacts;
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Container(
                child: ListTile(
                  onTap: () {
                    launch("tel://${item.number}");
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)]
                        [Random().nextInt(9) * 100],
                    child: Text(item.name[0].toUpperCase()),
                    foregroundColor: Colors.white,
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.number),
                ),
              ),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                    setState(() {
                      context.read<UserContactStore>().removeUserContact(index);
                    });
                  },
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
