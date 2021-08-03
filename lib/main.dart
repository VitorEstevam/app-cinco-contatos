import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'models/contact/userContactStore.dart';
import 'models/user/userStore.dart';
import 'pages/contacts/contacts_page.dart';
import 'pages/login/enter_page.dart';

void main() {
  runApp(AppProvider());
}

class AppProvider extends StatelessWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStore>(create: (_) => UserStore()),
        Provider<UserContactStore>(create: (_) => UserContactStore()),
      ],
      child: MaterialApp(
        title: 'Cinco contatos',
        theme: ThemeData.light(),
        home: MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (context.watch<UserStore>().user == null)
        return Builder(builder: (context) => EnterPage());
      else
        return Builder(builder: (context) => ContactsPage());
    });
  }
}
