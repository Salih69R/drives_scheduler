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
      height: 20,
      thickness: 2,
      indent: 5,
      endIndent: 5,
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text('DrvFulNam: ${driver.DrvFulNam}')),
                            Expanded(child: Text('DrvCode: ${driver.DrvCode}'))
                          ])),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text('LinchNum: ${driver.LinchNum}')),
                            Expanded(
                                child: Text('LicnType: ${driver.LicnType}')),
                          ])),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text('LicnYear: ${driver.LicnYear}')),
                            Expanded(
                                child: Text(
                              'LincExpDt: ${driver.LincExpDt}',
                              style: TextStyle(
                                  color: isDateFarEnough(driver.LincExpDt)
                                      ? Colors.green
                                      : Colors.red),
                            )),
                          ])),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text(
                            'Cel1: ${driver.Cel1}',
                          )),
                          Expanded(child: Text('Cel2: ${driver.Cel2}')),
                        ],
                      )),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text(
                            'Tel1: ${driver.Tel1}',
                          )),
                          Expanded(child: Text('Tel2: ${driver.Tel2}')),
                        ],
                      )),
                ],
              ),
            ))),
          ],
        ),
      ),
    );
  }
}
