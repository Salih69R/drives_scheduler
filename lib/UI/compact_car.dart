import 'package:drives_scheduler/DATA/Model/car.dart';
import 'package:drives_scheduler/DATA/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detailed_car.dart';

class CompactCar extends StatelessWidget {
  CompactCar({Key? key, required this.car, required this.http})
      : super(key: key);
  final Car car;
  final HttpService http;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ExcludeSemantics(
        child: CircleAvatar(child: Text('car number: ${car.VehNumber}')),
      ),
      title: Text('VTestDate: ${car.VTestDate}'),
      subtitle: Text('VInsuDate: ${car.VInsuDate}'),
      isThreeLine: true,
      trailing: Text('VStatus: ${car.VStatus}'),
      onTap: () {
        //TODO: open detailed Car screen

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailedCar(http: http, vehCode: car.VehCode)),
        );
      },
    );
  }
}
