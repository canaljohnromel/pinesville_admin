import 'package:flutter/material.dart';
import 'package:pinesville_admin/dashboard.dart';
import 'package:pinesville_admin/login.dart';
import 'package:pinesville_admin/chats.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  runApp(MyApp());

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      // .then((_) => Get.put(AuthenticationRepository()));
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