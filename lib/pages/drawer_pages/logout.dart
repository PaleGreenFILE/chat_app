import 'package:chat_app/pages/home.dart';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Logout'),
          centerTitle: true,
          backgroundColor: Colors.indigo[800],
        ),
      );
}
