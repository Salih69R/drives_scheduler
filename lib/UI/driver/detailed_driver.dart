import 'package:drives_scheduler/data/date_validation.dart';
import 'package:drives_scheduler/data/model/driver.dart';
import 'package:flutter/material.dart';

class DetailedDriver extends StatelessWidget {
  const DetailedDriver({Key? key, required this.driver}) : super(key: key);
  final Driver driver;

  String _unNullStr(String? str) {
    return str == null || str == 'null' || str == 'nill' ? '' : str;
  }

  @override
  Widget build(BuildContext context) {
    Widget divider = const Divider(
      color: Colors.grey,
      height: 15,
      thickness: 1.5,
      indent: 4,
      endIndent: 4,
    );

    Widget card_code = Expanded(
        child: Card(
            margin: EdgeInsets.all(6),
            child: Center(
                child: Text('קוד נהג: ${driver.DrvCode}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center))));
    Widget card_name = Expanded(
        child: Card(
            margin: EdgeInsets.all(6),
            child: Center(
                child: Text('שם נהג: ${driver.DrvFulNam}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center))));
    Widget card_licType = Expanded(
        child: Card(
            margin: EdgeInsets.all(6),
            child: Center(
                child: Text('סוג רשיון: ${driver.LicnType}',
                    textAlign: TextAlign.center))));

    //TODO: since licnhNum is always null in the json...
    // should I not show it at all
    Widget card_licNum = Expanded(
        child: Card(
            margin: EdgeInsets.all(6),
            child: Center(
                child: Text('מספר רשיון: ${_unNullStr(driver.LinchNum)}'))));

    Widget card_licExp = Expanded(
        child: Card(
            margin: EdgeInsets.all(6),
            child: Center(
                child: Text('רשיון תקף עד: ${driver.LincExpDt}',
                    style: TextStyle(
                        color: isDateFarEnough(driver.LincExpDt)
                            ? Colors.green
                            : Colors.red),
                    textAlign: TextAlign.center))));

    Widget card_licYear = Expanded(
        child: Card(
            margin: EdgeInsets.all(6),
            child: Center(
                child: Text('שנת רשיון: ${driver.LicnYear}',
                    textAlign: TextAlign.center))));

    Widget card_cel1 = Expanded(
        child: Card(
            margin: EdgeInsets.all(6),
            child: Center(
                child: Text('נייד 1: ${driver.Cel1}',
                    textAlign: TextAlign.center))));
    Widget card_cel2 = Expanded(
        child: Card(
            margin: EdgeInsets.all(6),
            child: Center(
                child: Text('נייד 2: ${driver.Cel2}',
                    textAlign: TextAlign.center))));
    Widget card_tel1 = Expanded(
        child: Card(
            margin: EdgeInsets.all(6),
            child: Center(
                child: Text('נוסף 1: ${driver.Tel1}',
                    textAlign: TextAlign.center))));
    Widget card_tel2 = Expanded(
        child: Card(
            margin: EdgeInsets.all(6),
            child: Center(
                child: Text('נוסף 2: ${driver.Tel2}',
                    textAlign: TextAlign.center))));

    Widget row1_details = Flexible(
        //row1
        flex: 1,
        fit: FlexFit.tight,
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.perm_data_setting),
                  Text(
                    'פרטים',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(
                  child: Row(
                children: [card_name, card_code],
              ))
            ]));

    Widget row2 = Flexible(
        //row2
        flex: 2,
        fit: FlexFit.tight,
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.document_scanner),
                Text(
                  'רשיון',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [card_licNum, card_licType])),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [card_licExp, card_licYear]))
          ],
        ));

    Widget row3 = Flexible(
        //row3
        flex: 2,
        fit: FlexFit.tight,
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.phone_in_talk_rounded),
                Text(
                  'צור קשר',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [card_cel1, card_cel2],
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [card_tel1, card_tel2],
            ))
          ],
        ));

    Widget base = Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('${driver.DrvFulNam}'),
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: Column(
              children: [
                Expanded(
                    child: SafeArea(
                        child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [row1_details, divider, row2, divider, row3],
                  ),
                ))),
              ],
            ),
          ),
        ));

    return base;
  }
}
