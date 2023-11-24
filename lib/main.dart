
import 'package:aptproj/auth_page.dart';
import 'package:aptproj/detail-page.dart';
import 'package:aptproj/homepage.dart';
import 'package:aptproj/login_page.dart';
import 'package:aptproj/main_page.dart';
import 'package:aptproj/profilepage.dart';
import 'package:aptproj/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}



