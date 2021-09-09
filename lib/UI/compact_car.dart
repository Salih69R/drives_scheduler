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
        child: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            foregroundColor:
                car.VStatus == 'פעיל' ? Colors.lightGreen : Colors.red,
            child: Center(
                child: Title(
                    color: Colors.black,
                    title: 'VStatus ${car.VStatus}',
                    child: Text('${car.VStatus}')))),
      ),
      title: Text('VTestDate: ${car.VTestDate}'),
      subtitle: Text('VInsuDate: ${car.VInsuDate}'),
      isThreeLine: true,
      trailing: Text('VStatus: ${car.VehNumber}'),
      onTap: () {
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
