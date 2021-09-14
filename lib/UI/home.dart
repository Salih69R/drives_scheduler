import 'package:dio/dio.dart';
import 'package:drives_scheduler/UI/driver/compact_driver.dart';
import 'package:drives_scheduler/data/model/car/car.dart';
import 'package:drives_scheduler/data/model/driver.dart';
import 'package:drives_scheduler/data/http_service.dart';
import 'package:drives_scheduler/UI/car/compact_car.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  // final String name; required this.name

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin, RestorationMixin {
  final RestorableInt tabIndex = RestorableInt(0);
  late TabController _tabController;

  @override
  void initState() {
    _getDrivers();
    _getCars();
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
  var _drivers = [];
  bool loading_cars = true;
  bool loading_drivers = true;

  Future _getDrivers() async {
    Response response;
    try {
      response = await _http.getAllDrivers();
      if (response.statusCode == 200) {
        setState(() {
          loading_drivers = false;
          for (int i = 0; i < response.data.length; ++i) {
            // print('$i\n${response.data[i]}');
            _drivers.add(Driver.fromJson(response.data[i]));
          }
        });
      } else {
        print(
            'something went wrong with the response(statusCode not 200): $response\n');
      }
    } on Exception catch (e) {
      print('http get drivers error: $e');
    }
  }

  Future _getCars() async {
    Response response;
    try {
      response = await _http.getAllCars();
      if (response.statusCode == 200) {
        setState(() {
          loading_cars = false;
          for (int i = 0; i < response.data.length; ++i) {
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
    Widget loading_widget =
        Scaffold(body: const Center(child: CircularProgressIndicator()));

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
              title: Center(child: Text('בית')),
              automaticallyImplyLeading: false,
              bottom: TabBar(
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.white54,
                controller: _tabController,
                isScrollable: true,
                tabs: [
                  Tab(text: 'נהגים'),
                  Tab(text: 'רכבים'),
                ],
              ),
            ),
            body: Center(
              child: TabBarView(
                controller: _tabController,
                children: [
                  //each child in the TapBar needs to load first
                  loading_drivers
                      ? loading_widget
                      : Scrollbar(
                          child: ListView(
                            restorationId: 'drives_list_view',
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            children: [
                              for (int i = 0; i < _drivers.length; i++)
                                CompactDriver(driver: _drivers[i]),
                            ],
                          ),
                        ),

                  loading_cars
                      ? loading_widget
                      : Scrollbar(
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
            )));
  }
}
