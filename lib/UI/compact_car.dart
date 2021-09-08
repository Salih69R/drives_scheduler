import 'package:dio/dio.dart';
import 'package:drives_scheduler/DATA/Model/car.dart';
import 'package:drives_scheduler/DATA/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompactCar extends StatefulWidget {
  final Car car;
  CompactCar({required this.car, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CompactCarState(car);
}

class _CompactCarState extends State<CompactCar> {
  _CompactCarState(this._car);

  final Car _car;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: ExcludeSemantics(
          child: CircleAvatar(child: Text('Id: ${_car.Id}')),
        ),
        title: Text('VStatus: ${_car.VStatus}'),
        subtitle: Text('DrvCode: ${_car.DrvCode}'));
  }
}
