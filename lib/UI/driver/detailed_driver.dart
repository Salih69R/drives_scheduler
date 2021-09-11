import 'package:drives_scheduler/data/date_validation.dart';
import 'package:drives_scheduler/data/model/driver.dart';
import 'package:flutter/material.dart';

class DetailedDriver extends StatelessWidget {
  const DetailedDriver({Key? key, required this.driver}) : super(key: key);
  final Driver driver;

  @override
  Widget build(BuildContext context) {
    Widget row1_details = Flexible(
        //row1
        flex: 1,
        fit: FlexFit.tight,
        child: Card(
            margin: EdgeInsets.all(6),
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
                    children: [
                      Expanded(
                          child: Center(
                              child: Text('שם נהג ${driver.DrvFulNam}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                      Expanded(
                          child: Center(
                              child: Text(
                        'קוד נהג ${driver.DrvCode}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )))
                    ],
                  ))
                ])));

    Widget row2 = Flexible(
        //row2
        flex: 2,
        fit: FlexFit.tight,
        child: Card(
            margin: EdgeInsets.all(6),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.perm_data_setting),
                    Text(
                      'רשיון',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Expanded(
                          child: Center(
                              child: Text('LinchNum: ${driver.LinchNum}'))),
                      Expanded(
                          child: Center(
                              child: Text('LicnType: ${driver.LicnType}'))),
                    ])),
                Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Expanded(
                          child: Center(
                              child: Text('שנת רשיון: ${driver.LicnYear}'))),
                      Expanded(
                          child: Center(
                              child: Text(
                        'רשיון תקף עד: ${driver.LincExpDt}',
                        style: TextStyle(
                            color: isDateFarEnough(driver.LincExpDt)
                                ? Colors.green
                                : Colors.red),
                      ))),
                    ]))
              ],
            )));

    Widget row3 = Flexible(
        //row3
        flex: 2,
        fit: FlexFit.tight,
        child: Card(
            margin: EdgeInsets.all(6),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.perm_data_setting),
                    Text(
                      'צור קשר',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                      'נייד 1: ${driver.Cel1}',
                    ))),
                    Expanded(
                        child: Center(child: Text('נייד 2: ${driver.Cel2}'))),
                  ],
                )),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                      'נוסף 1: ${driver.Tel1}',
                    ))),
                    Expanded(
                        child: Center(child: Text('נוסף 2: ${driver.Tel2}'))),
                  ],
                ))
              ],
            )));

    Widget base = Scaffold(
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
              child: Column(),
            ))),
          ],
        ),
      ),
    );

    Widget divider = const Divider(
      color: Colors.grey,
      height: 10,
      thickness: 1,
      indent: 0,
      endIndent: 0,
    );

    return Scaffold(
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
                //base
                children: [row1_details, row2, row3],
              ),
            ))),
          ],
        ),
      ),
    );
  }
}
