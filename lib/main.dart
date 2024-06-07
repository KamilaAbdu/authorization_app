import 'package:authorization_app/pages/home_page.dart';
import 'package:authorization_app/pages/login_page.dart';
import 'package:authorization_app/pages/registration_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Практическое прилолжение',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/регистрация': (context) => RegistrationPage(),
      },
    );
  }
}
