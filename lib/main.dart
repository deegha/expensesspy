// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'screens/login_page.dart';
import 'screens/home_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  MainWidget({Key? key}) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return LoginPage();
            }
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.roboto().fontFamily,
          primaryColor: Color.fromARGB(255, 80, 164, 179),
          backgroundColor: Color.fromARGB(255, 80, 164, 179),
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
            headline2: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            bodyText1: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.white),
            bodyText2: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 150, 150, 150)),
          ),
          appBarTheme: AppBarTheme(color: Color.fromARGB(255, 80, 164, 179))),
    );
  }
}
