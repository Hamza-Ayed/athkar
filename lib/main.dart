import 'package:flutter/material.dart';

import 'Screen/Splash_Screen.dart';

void main() => runApp(Athkary());

class Athkary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '‏‏اذكار الصباح والمساء',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SplashScreenPage(),
    );
  }
}
