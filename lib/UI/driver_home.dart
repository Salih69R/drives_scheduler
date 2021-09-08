import 'package:dio/dio.dart';
import 'package:drives_scheduler/DATA/Model/car.dart';
import 'package:drives_scheduler/DATA/http_service.dart';
import 'package:drives_scheduler/UI/compact_car.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DriverHome extends StatefulWidget {
  DriverHome({Key? key}) : super(key: key);

  // final String name; required this.name

  @override
  _DriverHomeState createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome>
    with SingleTickerProviderStateMixin, RestorationMixin {
  final RestorableInt tabIndex = RestorableInt(0);
  late TabController _tabController;

  @override
  void initState() {
    // HttpService web = HttpService();
    // Future<Response> res = web.getRequest('http://amlht.com/api/Vehicles');
    // String data = res.toString();
    // print(data);

    _getcars();
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
  String? get restorationId => 'tab_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  HttpService _http = HttpService();
  var _cars = [];

  Future _getcars() async {
    Response response;
    try {
      response = await _http.getAllCars();
      if (response.statusCode == 200) {
        print('\n\n');

        print('succeful get response : ${response}\n');
        print('response.data : ${response.data}\n');
        print('response.data[0] : ${response.data[0]}\n');
        print('\n\n');
        setState(() {
          print('we have ${response.data.length} cars:\n');
          for (int i = 0; i < response.data.length; ++i) {
            print('response.data[$i] = ${response.data[i]}');
            _cars.add(Car.fromJson(response.data[i]));
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
  Widget build(BuildContext context) {
    print('in driver_home State, _cars.length = ${_cars.length}\n');
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
        body: Center(
          child: TabBarView(
            controller: _tabController,
            children: [
              Scrollbar(
                  child: Center(
                child: ListView(
                  restorationId: 'drives_list_view',
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    for (int index = 1; index < 21; index++)
                      ListTile(
                          leading: ExcludeSemantics(
                            child: CircleAvatar(child: Text('Drive $index')),
                          ),
                          title: Text('some name of a drive number $index'),
                          subtitle:
                              Text('some secandry info about this drive')),
                  ],
                ),
              )),
              Scrollbar(
                child: ListView(
                  restorationId: 'cars_list_view',
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    for (int i = 0; i < _cars.length; ++i)
                      CompactCar(
                        car: _cars[i],
                        http: _http,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
