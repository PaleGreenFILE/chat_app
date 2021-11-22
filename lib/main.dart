import 'package:chat_app/pages/home.dart';
import 'package:chat_app/pages/welcome_page.dart';

import 'package:chat_app/services/auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Andemu a Girandula',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: AuthServices().onChangedUser,
        builder: (context, snapshot) {
          return snapshot.data == null ? const WelcomePage() : HomePage();
        },
      ),
    );
  }
}
