import 'package:flutter/material.dart';

import 'login_component.dart';
import 'signup_page.dart';

class EnterPage extends StatelessWidget {
  const EnterPage({Key? key}) : super(key: key);

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
            Builder(builder: (context) => LoginComponent()),
            Builder(builder: (context) => SignupComponent()),
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
      ),
    );
  }
}
