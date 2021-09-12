import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:drives_scheduler/data/model/car/car_doc.dart';
import 'package:drives_scheduler/data/model/car/car_records.dart';
import 'package:drives_scheduler/data/date_validation.dart';
import 'package:drives_scheduler/data/http_service.dart';
import 'package:drives_scheduler/UI/car/car_doc_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DetailedCar extends StatefulWidget {
  DetailedCar({Key? key, required this.http, required this.vehCode})
      : super(key: key);
  final HttpService http;
  final String vehCode;

  @override
  State<StatefulWidget> createState() => _DetailedCarState(http, vehCode);
}

class _DetailedCarState extends State<DetailedCar>
    with SingleTickerProviderStateMixin, RestorationMixin {
  final RestorableInt tabIndex = RestorableInt(0);
  late CarRecords _carRecords;
  final HttpService _http;
  final String vehCode;
  bool loading = true;

  _DetailedCarState(this._http, this.vehCode);
  late TabController _tabController;

  @override
  void initState() {
    _getCarRecords();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //load
    if (loading)
      return Scaffold(body: const Center(child: CircularProgressIndicator()));

    Widget divider = const Divider(
      color: Colors.grey,
      height: 10,
      thickness: 1,
      indent: 2,
      endIndent: 2,
    );

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('רכב מספר ${_carRecords.car.VehNumber}'),
            automaticallyImplyLeading: false,
          ),
          bottomNavigationBar: Container(
              color: Colors.blue[400],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TabBar(
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    unselectedLabelColor: Colors.white54,
                    controller: _tabController,
                    isScrollable: true,
                    tabs: [
                      Tab(text: 'פרטי'),
                      Tab(text: 'מסמכים'),
                    ],
                  ),
                ],
              )),
          body: Center(
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    Expanded(
                        child: SafeArea(
                            child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          //////////////////////////////////////////begin///
                          Flexible(
                              flex: 2,
                              fit: FlexFit.tight,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.perm_data_setting),
                                      Text(
                                        'פרטים',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Card(
                                                  margin: EdgeInsets.all(6),
                                                  child: Center(
                                                    child: Text(
                                                        'קוד: ${_carRecords.car.VehCode}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ))),
                                          Expanded(
                                            child: Card(
                                                margin: EdgeInsets.all(6),
                                                child: Center(
                                                    child: Text(
                                                        'מספר: ${_carRecords.car.VehNumber}',
                                                        textAlign:
                                                            TextAlign.center))),
                                          )
                                        ],
                                      )),
                                  Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Card(
                                                  margin: EdgeInsets.all(6),
                                                  child: Center(
                                                      child: Text(
                                                          'סטטוס: ${_carRecords.car.VStatus != null ? _carRecords.car.VStatus : ''}',
                                                          textAlign: TextAlign
                                                              .center))),
                                            ),
                                            Expanded(
                                                child: Card(
                                                    margin: EdgeInsets.all(6),
                                                    child: Center(
                                                        child: Text(
                                                            'קוד נעילה: ${_carRecords.car.VLockCode}',
                                                            textAlign: TextAlign
                                                                .center))))
                                          ])),
                                ],
                              )),

                          divider,
                          Flexible(
                              flex: 2,
                              fit: FlexFit.tight,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.auto_fix_high),
                                      Text(
                                        'טיפולים',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Card(
                                                  margin: EdgeInsets.all(6),
                                                  child: Center(
                                                      child: Text(
                                                          'ק"מ לטיימינג הבא: ${_carRecords.car.KilmtrTimng}',
                                                          textAlign: TextAlign
                                                              .center))),
                                            ),
                                            Expanded(
                                              child: Card(
                                                  margin: EdgeInsets.all(6),
                                                  child: Center(
                                                      child: Text(
                                                          'קילומטר: ${_carRecords.car.Kilometer}',
                                                          textAlign: TextAlign
                                                              .center))),
                                            )
                                          ])),
                                  Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Card(
                                                  margin: EdgeInsets.all(6),
                                                  child: Center(
                                                      child: Text(
                                                          'הטיפול הבא: ${_carRecords.car.VKiloMtr}',
                                                          textAlign: TextAlign
                                                              .center))),
                                            ),
                                            Expanded(
                                              child: Card(
                                                  margin: EdgeInsets.all(6),
                                                  child: Center(
                                                      child: Text(
                                                          'טיפול אחרון: ${_carRecords.car.Treatment}',
                                                          textAlign: TextAlign
                                                              .center))),
                                            )
                                          ])),
                                ],
                              )),
                          divider,
                          Flexible(
                              flex: 3,
                              fit: FlexFit.tight,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.date_range),
                                      Text(
                                        'תאיריכים ואישורים',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: Card(
                                                    margin: EdgeInsets.all(6),
                                                    child: Center(
                                                      child: Text(
                                                          'אישור הפעלה: ${_carRecords.car.ActivatDate}',
                                                          style: TextStyle(
                                                              color: isDateFarEnough(
                                                                      _carRecords
                                                                          .car
                                                                          .ActivatDate)
                                                                  ? Colors.green
                                                                  : Colors.red),
                                                          textAlign:
                                                              TextAlign.center),
                                                    ))),
                                            Expanded(
                                                child: Card(
                                                    margin: EdgeInsets.all(6),
                                                    child: Center(
                                                      child: Text(
                                                          'תאריך מנהלה: ${_carRecords.car.AdminDate}',
                                                          style: TextStyle(
                                                              color: isDateFarEnough(
                                                                      _carRecords
                                                                          .car
                                                                          .AdminDate)
                                                                  ? Colors.green
                                                                  : Colors.red),
                                                          textAlign:
                                                              TextAlign.center),
                                                    )))
                                          ])),
                                  Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: Card(
                                                    margin: EdgeInsets.all(6),
                                                    child: Center(
                                                      child: Text(
                                                          'אישור בלמים: ${_carRecords.car.BrakesDate}',
                                                          style: TextStyle(
                                                              color: isDateFarEnough(
                                                                      _carRecords
                                                                          .car
                                                                          .BrakesDate)
                                                                  ? Colors.green
                                                                  : Colors.red),
                                                          textAlign:
                                                              TextAlign.center),
                                                    ))),
                                            Expanded(
                                                child: Card(
                                                    margin: EdgeInsets.all(6),
                                                    child: Center(
                                                      child: Text(
                                                          'תאריך פקיעת הביטוח: ${_carRecords.car.VInsuDate}',
                                                          style: TextStyle(
                                                              color: isDateFarEnough(
                                                                      _carRecords
                                                                          .car
                                                                          .VInsuDate)
                                                                  ? Colors.green
                                                                  : Colors.red),
                                                          textAlign:
                                                              TextAlign.center),
                                                    )))
                                          ])),
                                  Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: Card(
                                                    margin: EdgeInsets.all(6),
                                                    child: Center(
                                                      child: Text(
                                                        'תאריך הטסט הבא: ${_carRecords.car.VTestDate}',
                                                        style: TextStyle(
                                                            color: isDateFarEnough(
                                                                    _carRecords
                                                                        .car
                                                                        .VTestDate)
                                                                ? Colors.green
                                                                : Colors.red),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ))),
                                            Expanded(
                                                child: Card(
                                                    margin: EdgeInsets.all(6),
                                                    child: Center(
                                                      child: Text(
                                                          'בדיקת חורף: ${_carRecords.car.WinterDate}',
                                                          style: TextStyle(
                                                              color: isDateFarEnough(
                                                                      _carRecords
                                                                          .car
                                                                          .ActivatDate)
                                                                  ? Colors.green
                                                                  : Colors.red),
                                                          textAlign:
                                                              TextAlign.center),
                                                    ))),
                                          ])),
                                ],
                              )),
                          //////////////////////////////////////////end///
                        ],
                      ),
                    ))),
                  ],
                ),
                Scrollbar(
                    child: ListView(
                        restorationId: 'documents_list_view',
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        children: [
                      for (int i = 0; i < _carRecords.records.length; ++i)
                        SafeArea(
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Column(children: [
                                  CarDocWidget(
                                      documment: CarDoc.fromJson(
                                          _carRecords.records[i])),
                                  divider,
                                ]))),
                    ]))
              ],
            ),
          ),
        ));
  }

  Future _getCarRecords() async {
    Response response;
    try {
      response = await _http.getCarRecords(vehCode);
      if (response.statusCode == 200) {
        setState(() {
          loading = false;
          _carRecords = CarRecords.fromJson(response.data);
        });
      } else {
        print(
            'something went wrong with the response(statusCode not 200): $response\n');
      }
    } on Exception catch (e) {
      print('http get cars error: $e');
    }
  }

  @override
  String? get restorationId => 'Car Detail and Records';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }
}
