import 'package:dio/dio.dart';
import 'package:drives_scheduler/DATA/Model/car_records.dart';
import 'package:drives_scheduler/DATA/http_service.dart';
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
      thickness: 1,
      indent: 20,
      endIndent: 20,
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Driver\'s Home'),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: [
              Tab(text: 'my drives'),
              Tab(text: 'my cars'),
            ],
          ),
        ),
        body: Scrollbar(
          child: Column(
            children: [
              Text('text 1'),
              Text('text 2'),
              Text('text 3'),
              Text('text 4'),
              SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Title(color: Colors.black, child: Text('Title')),
                        divider,
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Back'))
                      ],
                    ),
                  ))
            ],
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
          print(
              'succefully got response: \n $response \n response.data: \n $response\n\n');
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
