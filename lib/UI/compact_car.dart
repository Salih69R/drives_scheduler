// import 'package:dio/dio.dart';
// import 'package:drives_scheduler/DATA/http_service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CompactCar extends StatefulWidget {
//   final String carPath;
//   CompactCar({required this.carPath, Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _CompactCarState();
// }

// class _CompactCarState extends State<CompactCar> {
//   int index = 0;

//   HttpService _http = HttpService();

//   Future getcars() async {
//     Response response = await _http.getAllCars();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         leading: ExcludeSemantics(
//           child: CircleAvatar(child: Text('Car $index')),
//         ),
//         title: Text('some name of car number $index'),
//         subtitle: Text('some secandry info about this car'));
//   }
// }
