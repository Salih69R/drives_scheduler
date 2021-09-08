import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:drives_scheduler/DATA/Model/car.dart';
import 'package:drives_scheduler/DATA/http_service.dart';

class DriverHome extends StatefulWidget {
  DriverHome({Key? key}) : super(key: key);

  // final String name; required this.name

  @override
  _DriverHomeState createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late List<String> drives; // by id?
  late List<int> cars; //by id?

  final RestorableInt tabIndex = RestorableInt(0);
  late TabController _tabController;

  @override
  void initState() {
    // HttpService web = HttpService();
    // Future<Response> res = web.getRequest('http://amlht.com/api/Vehicles');
    // String data = res.toString();
    // print(data);

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

  @override
  Widget build(BuildContext context) {
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
      body: TabBarView(
        controller: _tabController,
        children: [
          Scrollbar(
            child: ListView(
              restorationId: 'cars_list_view',
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                for (int index = 1; index < 21; index++)
                  ListTile(
                      leading: ExcludeSemantics(
                        child: CircleAvatar(child: Text('Car $index')),
                      ),
                      title: Text('some name of car number $index'),
                      subtitle: Text('some secandry info about this car')),
              ],
            ),
          ),
          Scrollbar(
            child: ListView(
              restorationId: 'cars_list_view',
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                for (int index = 1; index < 21; index++)
                  ListTile(
                      leading: ExcludeSemantics(
                        child: CircleAvatar(child: Text('Car $index')),
                      ),
                      title: Text('some name of car number $index'),
                      subtitle: Text('some secandry info about this car')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
