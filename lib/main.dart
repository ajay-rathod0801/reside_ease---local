import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reside_ease/firebase_options.dart';
import 'package:reside_ease/introductory_screen.dart';
import 'package:reside_ease/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color.fromRGBO(249, 249, 255, 1),
      ),
      home: LoginScreen(),
    );
  }
}
