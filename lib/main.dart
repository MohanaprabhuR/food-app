import 'package:flutter/material.dart';
import 'constant.dart';
import 'home_screen.dart';
import 'login_screen.dart';

void main() {
  runApp(InitialScreen());
}

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
