import 'package:flutter/material.dart';

import '../home.dart';

class Friends extends StatelessWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Friends'),
          centerTitle: true,
          backgroundColor: Colors.indigo[800],
        ),
      );
}
