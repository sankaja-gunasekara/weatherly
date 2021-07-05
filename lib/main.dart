import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
import 'utilities/constants.dart';

void main() {
  runApp(Weatherly());
}

class Weatherly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: kBackgroundColor,
      ),
      home: LoadingScreen(),
    );
  }
}
