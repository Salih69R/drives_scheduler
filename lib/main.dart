import 'package:drives_scheduler/UI/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Directionality(textDirection: TextDirection.rtl, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driver Scheduler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
