import 'package:chat_app/pages/home.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
          backgroundColor: Colors.indigo[800],
        ),
      );
}
