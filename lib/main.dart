import 'package:ecommerce_app/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

bool shouldUseFirebaseEmulator = false;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // if (!kIsWeb) {
  //   await Firebase.initializeApp();
  // } else {
  //   try {
  //     await Firebase.initializeApp(
  //       options: const FirebaseOptions(
  //         apiKey: 'AIzaSyC5aNieKhi9XYZdnUsrgtojtGOIg71dzp8',
  //         appId: '1:631463811506:android:c7435547d780075e202cab',
  //         messagingSenderId: '448618578101',
  //         projectId: 'ecommerce-flutter-app-e8efa',
  //         authDomain: 'ecommerce-flutter-app-e8efa.firebaseapp.com',
  //         databaseURL: 'https://ecommerce-flutter-app-e8efa.firebaseio.com',
  //         storageBucket: 'ecommerce-flutter-app-e8efa.appspot.com',
  //         measurementId: 'G-F79DJ0VFGS',
  //       ),
  //     );
  //   } on FirebaseException catch (e) {
  //     print(e.message);
  //   }
  // }

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
