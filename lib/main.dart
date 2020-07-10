import 'package:flutter/material.dart';
import 'package:instagramtworecord/constants/material_white.dart';
import 'package:instagramtworecord/home_page.dart';
import 'package:instagramtworecord/screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
