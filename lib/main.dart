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
          primaryTextTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 24), //tab title size
            headline6: TextStyle(fontSize: 28), //app Bar title
          ),
          textTheme: TextTheme(
            bodyText2:
                TextStyle(fontSize: 20), //secondary list tile, and normal Text
            subtitle1: TextStyle(fontSize: 22), //main list tile
          )),
      home: Home(),
    );
  }
}
