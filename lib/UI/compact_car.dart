import 'dart:html';

import 'package:dio/dio.dart';
import 'package:drives_scheduler/DATA/Model/car.dart';
import 'package:drives_scheduler/DATA/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompactCar extends StatelessWidget {
  CompactCar({Key? key, required this.car, required this.http})
      : super(key: key);
  final Car car;
  final HttpService http;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ExcludeSemantics(
        child: CircleAvatar(child: Text('Id: ${car.Id}')),
      ),
      title: Text('ActivatDate: ${car.ActivatDate}'),
      subtitle: Text('DrvCode: ${car.DrvCode}'),
      isThreeLine: true,
      trailing: Text('VStatus: ${car.VStatus}'),
      onTap: () {
        //TODO: open detailed Car screen
        http.getCarRecords(car.VehCode);
      },
    );
  }
}
