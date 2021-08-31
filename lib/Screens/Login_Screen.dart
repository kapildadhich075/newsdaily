import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsdaily/Components/Button.dart';
import 'package:newsdaily/Screens/NewsScreen.dart';
import 'package:newsdaily/Screens/SignUp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants.dart';

class LoginScreen extends StatefulWidget {
  static String page = 'Login_page';
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String? email;
  String? password;

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
              controller: emailController,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your E-mail',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              style: TextStyle(color: Colors.black),
              controller: passController,
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
              buttonName: 'Log In',
              onPressed: () async {
                try {
                  final user = await _auth
                      .signInWithEmailAndPassword(
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
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.setString('email', emailController.text);
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
                  Navigator.pushNamed(context, SignUpScreen.page);
                },
                child: Text(
                  'Don\'t have any account',
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
