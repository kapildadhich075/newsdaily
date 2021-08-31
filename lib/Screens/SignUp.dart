import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsdaily/Components/Button.dart';
import 'package:newsdaily/Screens/NewsScreen.dart';

import '../Constants.dart';
import 'Login_Screen.dart';

class SignUpScreen extends StatefulWidget {
  static String page = 'SignUp_page';
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 1,
              child: Image.asset(
                "assets/newsdaily.png",
                height: 200.0,
                width: 200.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                email = value;
              },
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your E-mail',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.visiblePassword,
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your Password',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Button(
              buttonName: 'Sign-Up',
              onPressed: () async {
                setState(() {});
                try {
                  final user = await _auth
                      .createUserWithEmailAndPassword(
                          email: email!, password: password!)
                      .catchError((err) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(err.message),
                            actions: [
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text("Ok"),
                              ),
                            ],
                          );
                        });
                  });

                  if (user != null) {
                    Navigator.pushNamed(context, NewsScreen.page);
                  }
                  setState(() {});
                } catch (e) {
                  print(e);
                }
              },
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 80.0, right: 80.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.page);
                },
                child: Text(
                  'Already have an account',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
