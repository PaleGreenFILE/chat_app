import 'package:chat_app/pages/home.dart';
import 'package:flutter/material.dart';

class Updates extends StatelessWidget {
  const Updates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Updates'),
          centerTitle: true,
          backgroundColor: Colors.indigo[800],
        ),
      );
}
