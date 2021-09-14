import 'package:drives_scheduler/UI/driver/detailed_driver.dart';
import 'package:drives_scheduler/data/date_validation.dart';
import 'package:flutter/material.dart';
import 'package:drives_scheduler/data/model/driver.dart';

class CompactDriver extends StatelessWidget {
  const CompactDriver({Key? key, required this.driver}) : super(key: key);
  final Driver driver;

  @override
  Widget build(BuildContext context) {
    Color color_by_date = isDateFarEnough(driver.LincExpDt)
        ? Colors.white
        : Colors.redAccent.shade100;
    Widget subtitle_by_date = isDateFarEnough(driver.LincExpDt)
        ? Center()
        : Text('אזהרה! אתה צריך לעדכן את הרשיון שלך!');

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
              Icons.person_pin,
              size: 35,
              semanticLabel: 'Driver Icon',
            ),
          ),
        ),
        title: Text('${driver.DrvFulNam}'),
        subtitle: subtitle_by_date,
        isThreeLine: false,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedDriver(driver: driver)),
          );
        },
      ),
    );
  }
}
