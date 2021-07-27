import 'package:cinco_contatos/counter.dart';
import 'package:cinco_contatos/login/login_page.dart';
import 'package:cinco_contatos/login/signupPage.dart';
import 'package:cinco_contatos/screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppProvider());
}

class AppProvider extends StatelessWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Counter>(create: (_) => Counter()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context.read<Counter>().getValueFromMemory();

    return MaterialApp(
      title: 'Cinco contatos',
      theme: ThemeData.light(),
      home: DefaultTabController(
        length: 2,
        child: appCanvas(),
      ),
    );
  }
}

class appCanvas extends StatelessWidget {
  const appCanvas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Cinco contatos'),
      ),
      body: TabBarView(
        children: [
          Builder(builder: (context) => LoginPage()),
          Builder(builder: (context) => SignupPage()),
        ],
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        child: const TabBar(
          // indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Text("Login")),
            Tab(icon: Text("Signup")),
          ],
        ),
      ),
    );
  }
}
