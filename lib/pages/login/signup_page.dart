import 'package:cinco_contatos/models/user/userStore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SignupComponent extends StatefulWidget {
  const SignupComponent({Key? key}) : super(key: key);

  @override
  _SignupComponentState createState() => _SignupComponentState();
}

class _SignupComponentState extends State<SignupComponent> {
  String? name, email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Signup',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              onChanged: (text) {
                name = text;
              },
              decoration: InputDecoration(
                hintText: 'Name',
                suffixIcon: Icon(Icons.account_circle),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (text) {
                email = text;
              },
              decoration: InputDecoration(
                hintText: 'Email',
                suffixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (text) {
                password = text;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: Icon(Icons.visibility_off),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              child: Text('Signup'),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 50)),
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor)),
              onPressed: () {
                this.setState(() {
                  context.read<UserStore>().fakeLogin(
                      pName: name, pEmail: email, pPassword: password);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
