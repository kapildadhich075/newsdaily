import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsdaily/Screens/HomeScreen.dart';
import 'package:newsdaily/Screens/Login_Screen.dart';
import 'package:newsdaily/Screens/NewsScreen.dart';
import 'package:newsdaily/Screens/NewsView.dart';
import 'package:newsdaily/Screens/SignUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  runApp(
    MyApp(
      route: email == null ? HomeScreen.page : NewsScreen.page,
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String? route;
  MyApp({this.route});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewsDaily',
      initialRoute: route,
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
