import 'package:dio/dio.dart';
import 'package:drives_scheduler/DATA/Model/car_doc.dart';
import 'package:drives_scheduler/DATA/Model/car_records.dart';
import 'package:drives_scheduler/DATA/http_service.dart';
import 'package:drives_scheduler/UI/car_doc_widget.dart';
import 'package:flutter/cupertino.dart';
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
      height: 20,
      thickness: 2,
      indent: 5,
      endIndent: 5,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Driver\'s Home'),
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(text: 'Vehicle details'),
            Tab(text: 'Documents and Records'),
          ],
        ),
      ),
      body: Center(
        child: TabBarView(
          controller: _tabController,
          children: [
            Column(
              children: [
                Expanded(
                    child: SafeArea(
                        child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    children: [
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Text('Id: ${_carRecords.car.Id}')),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Text(
                            'VehCode: ${_carRecords.car.VehCode}',
                            textAlign: TextAlign.end,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                              Text('VehNumber: ${_carRecords.car.VehNumber}')),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Text(
                              'ActivatDate: ${_carRecords.car.ActivatDate}')),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                              Text('AdminDate: ${_carRecords.car.AdminDate}')),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Text(
                              'BrakesDate: ${_carRecords.car.BrakesDate}')),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Text('DrvCode: ${_carRecords.car.DrvCode}')),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Text(
                              'KilmtrTimng: ${_carRecords.car.KilmtrTimng}')),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                              Text('Kilometer: ${_carRecords.car.Kilometer}')),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Text('VKiloMtr: ${_carRecords.car.VKiloMtr}')),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                              Text('Treatment: ${_carRecords.car.Treatment}')),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                              Text('VInsuDate: ${_carRecords.car.VInsuDate}')),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                              Text('VTestDate: ${_carRecords.car.VTestDate}')),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Text('VStatus: ${_carRecords.car.VStatus}')),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Text(
                              'WinterDate: ${_carRecords.car.WinterDate}')),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child:
                              Text('VLockCode: ${_carRecords.car.VLockCode}')),
                    ],
                  ),
                ))),
                //some list of docs
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
                                  CarDoc.fromJson(_carRecords.records[i])),
                              divider,
                            ]))),
                ]))
          ],
        ),
        // SafeArea(
        //     top: false,
        //     child: Padding(
        //       padding: const EdgeInsets.all(8),
        //       child: Column(
        //         children: [
        //           Title(color: Colors.black, child: Text('Title')),
        //           divider,
        //           divider,
        //           divider,
        //           ElevatedButton(
        //               onPressed: () {
        //                 Navigator.pop(context);
        //               },
        //               child: Text('Back'))
        //         ],
        //       ),
        //     ))
      ),
    );
  }

  Future _getCarRecords() async {
    Response response;
    try {
      response = await _http.getCarRecords(vehCode);
      if (response.statusCode == 200) {
        setState(() {
          loading = false;
          print(
              'succefully got response: \n $response \n response.data: \n $response\n\n');
          _carRecords = CarRecords.fromJson(response.data);
          print(
              '\nalso, _carRecords.records.length = ${_carRecords.records.length}');
          for (int i = 0; i < _carRecords.records.length; ++i) {
            print('_carRecords.records[i] = ${_carRecords.records[i]}');
          }
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
