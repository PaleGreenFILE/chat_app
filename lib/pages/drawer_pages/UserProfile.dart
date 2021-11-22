// ignore_for_file: file_names

import 'package:chat_app/services/auth_services.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String name;
  final String urlImage;

  const UserProfile({
    Key? key,
    required this.name,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(" ${AuthServices().user.displayName}"),
          centerTitle: true,
        ),
        body: Image.network(
          urlImage,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
}
