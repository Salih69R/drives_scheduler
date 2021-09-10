import 'package:dio/dio.dart';
import 'package:drives_scheduler/DATA/Model/Car/car.dart';
import 'package:drives_scheduler/DATA/http_service.dart';
import 'package:drives_scheduler/UI/compact_car.dart';
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
  bool loading = true;

  Future _getcars() async {
    Response response;
    try {
      response = await _http.getAllCars();
      if (response.statusCode == 200) {
        setState(() {
          loading = false;
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
    //load
    if (loading)
      return Scaffold(body: const Center(child: CircularProgressIndicator()));
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Driver\'s Home')),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white54,
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
                    // for (int index = 1; index < 21; index++)
                    //   ListTile(
                    //       leading: ExcludeSemantics(
                    //         child: CircleAvatar(child: Text('Drive $index')),
                    //       ),
                    //       title: Text('some name of a drive number $index'),
                    //       subtitle:
                    //           Text('some secandry info about this drive')),
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
