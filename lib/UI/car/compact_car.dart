import 'package:drives_scheduler/data/model/car/car.dart';
import 'package:drives_scheduler/data/date_validation.dart';
import 'package:drives_scheduler/data/http_service.dart';
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
    int un_valid_dates = carCountUnValidDates(car);
    Color color_by_date = un_valid_dates == 0 ? Colors.white : Colors.red;
    Widget subtitle_by_date = un_valid_dates == 0
        ? Center()
        : Text('WARNING! you have $un_valid_dates dates you need to extend');

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200, width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        contentPadding: EdgeInsets.all(2),
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
    );
  }
}
