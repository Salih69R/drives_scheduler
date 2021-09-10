import 'package:drives_scheduler/DATA/Model/Car/car.dart';
import 'package:drives_scheduler/DATA/date_validation.dart';
import 'package:drives_scheduler/DATA/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detailed_car.dart';

//is basically a ListTile
class CompactCar extends StatelessWidget {
  CompactCar({Key? key, required this.car, required this.http})
      : super(key: key);
  final Car car;
  final HttpService http;

  @override
  Widget build(BuildContext context) {
    Color color_by_date =
        isCarDatesValid(car) ? Colors.transparent : Colors.red;
    Widget subtitle_by_date = isCarDatesValid(car)
        ? Center()
        : Text('some date will expire in less than a month!');

    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(4),
      child: ListTile(
        tileColor: color_by_date,
        leading: ExcludeSemantics(
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.black,
            child: Icon(
              Icons.directions_car_filled_rounded,
              size: 35,
              semanticLabel: 'Car Icon',
            ),
          ),
        ),
        title: Text('${car.VehNumber}'),
        subtitle: subtitle_by_date,
        isThreeLine: false,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailedCar(http: http, vehCode: car.VehCode)),
          );
        },
      ),
    ));
  }
}
