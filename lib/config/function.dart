import 'package:flutter/material.dart';


navigateToNextPage(context, Widget page){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>page));
}