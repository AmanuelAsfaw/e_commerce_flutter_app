import 'package:ecommerce_app/screens/login.dart';
import 'package:ecommerce_app/screens/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      // home: const SignUp(),
      home: const Login(),
    );
  }
}
