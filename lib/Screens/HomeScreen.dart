import 'package:flutter/material.dart';
import 'package:newsdaily/Components/Button.dart';
import 'package:newsdaily/Screens/Login_Screen.dart';
import 'package:newsdaily/Screens/SignUp.dart';

class HomeScreen extends StatefulWidget {
  static String page = 'Home_page';
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              height: 40.0,
            ),
            Button(
              buttonName: "Log-in",
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.page);
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Button(
              buttonName: "Sign-up",
              onPressed: () {
                Navigator.pushNamed(context, SignUpScreen.page);
              },
            ),
          ],
        ),
      ),
    );
  }
}
