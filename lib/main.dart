import 'package:flutter/material.dart';
import 'package:pinesville_admin/dashboard.dart';
import 'package:pinesville_admin/login.dart';
import 'package:pinesville_admin/chats.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: DashboardScreen(),
    );
  }
}