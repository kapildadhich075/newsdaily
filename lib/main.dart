import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsdaily/Screens/HomeScreen.dart';
import 'package:newsdaily/Screens/Login_Screen.dart';
import 'package:newsdaily/Screens/NewsScreen.dart';
import 'package:newsdaily/Screens/NewsView.dart';
import 'package:newsdaily/Screens/SignUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewsDaily',
      initialRoute: NewsScreen.page,
      routes: {
        LoginScreen.page: (context) => LoginScreen(),
        NewsScreen.page: (context) => NewsScreen(),
        HomeScreen.page: (context) => HomeScreen(),
        SignUpScreen.page: (context) => SignUpScreen(),
        NewsView.page: (context) => NewsView(),
      },
    );
  }
}
