import 'package:flutter/material.dart';
import 'package:registration_ui/login_email_page.dart';
import 'package:registration_ui/register_email_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginEmailPage()
    );
  }
}