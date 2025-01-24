import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pinesville_admin/dashboard.dart';
import 'package:pinesville_admin/login.dart';
import 'package:pinesville_admin/chats.dart';
import 'package:pinesville_admin/tenants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pinesville Pasig',
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: DashboardScreen(),
    );
  }
}