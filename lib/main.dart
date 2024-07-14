//import 'package:login_auth/function/aurthfunction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_auth/function/Dashboard.dart';
import 'package:login_auth/DatabaseOption.dart';
import 'package:login_auth/login_auth.dart';
import 'firebase_options.dart';
import 'function/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/dashboard': (contex) => Dashboard(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (contex, snapshot) {
            if (snapshot.hasData) {
              return DatabaseOption();
            } else {
              return Login_auth();
            }
          },
        ),
      
    );
  }
}
