import 'package:drives_scheduler/data/date_validation.dart';
import 'package:drives_scheduler/data/model/driver.dart';
import 'package:flutter/material.dart';

class DetailedDriver extends StatelessWidget {
  const DetailedDriver({Key? key, required this.driver}) : super(key: key);
  final Driver driver;

  @override
  Widget build(BuildContext context) {
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
                children: [
                  Row(
                    children: [
                      Icon(Icons.perm_data_setting),
                      Text(
                        'Details',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Card(
                          margin: EdgeInsets.all(6),
                          child: Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Center(
                                        child: Text(
                                            'DrvFulNam: ${driver.DrvFulNam}'))),
                                Expanded(
                                    child: Center(
                                        child:
                                            Text('DrvCode: ${driver.DrvCode}')))
                              ]))),
                  Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Card(
                          margin: EdgeInsets.all(6),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                    Expanded(
                                        child: Center(
                                            child: Text(
                                                'LinchNum: ${driver.LinchNum}'))),
                                    Expanded(
                                        child: Center(
                                            child: Text(
                                                'LicnType: ${driver.LicnType}'))),
                                  ])),
                              Expanded(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                    Expanded(
                                        child: Center(
                                            child: Text(
                                                'LicnYear: ${driver.LicnYear}'))),
                                    Expanded(
                                        child: Center(
                                            child: Text(
                                      'LincExpDt: ${driver.LincExpDt}',
                                      style: TextStyle(
                                          color:
                                              isDateFarEnough(driver.LincExpDt)
                                                  ? Colors.green
                                                  : Colors.red),
                                    ))),
                                  ]))
                            ],
                          ))),
                  Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Card(
                          margin: EdgeInsets.all(6),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Center(
                                          child: Text(
                                    'Cel1: ${driver.Cel1}',
                                  ))),
                                  Expanded(
                                      child: Center(
                                          child: Text('Cel2: ${driver.Cel2}'))),
                                ],
                              )),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Center(
                                          child: Text(
                                    'Tel1: ${driver.Tel1}',
                                  ))),
                                  Expanded(
                                      child: Center(
                                          child: Text('Tel2: ${driver.Tel2}'))),
                                ],
                              ))
                            ],
                          ))),
                ],
              ),
            ))),
          ],
        ),
      ),
    );
  }
}
