import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ble_app/router/pages.dart';
import 'package:ble_app/screens/sensorlist/sensorlist_view.dart';
import 'package:ble_app/screens/sensorblocks/sensorblocks_view.dart';
import 'package:ble_app/screens/sensorgraph/sensorgraph_view.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensor monitoring'),
        actions: [
          IconButton(
              icon: Icon(Icons.bluetooth_connected),
              onPressed: controller.onConnectTap),
        ],
      ),
      body: GetBuilder<HomeController>(builder: (c) {
        if (c.connected.value) {
          print('c.connected.value updated in home_view');
          return PageView(
            controller: c.pageController,
            onPageChanged: c.onPageChanged,
            physics: BouncingScrollPhysics(),
            children: [
              SensorListView(),
              SensorBlocksView(),
              SensorGraphView(),
            ],
          );
        } else {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.signal_wifi_off,
                  color: Colors.grey.withOpacity(0.25),
                  size: 250,
                ),
                Text('Not connected', style: TextStyle(color: Colors.grey))
              ],
            ),
          );
        }
      }),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: ListView(
                primary: false,
                children: <Widget>[
                  ListTile(
                    title: Text('Bluetooth connections'),
                    onTap: () => Get.toNamed(Routes.BluetoothRoute),
                    leading: Icon(Icons.bluetooth),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.index.value,
          onTap: controller.onBarTap,
          items: [
            BottomNavigationBarItem(
                title: Text('List'), icon: Icon(Icons.list)),
            BottomNavigationBarItem(
                title: Text('Blocks'), icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                title: Text('Graph'), icon: Icon(Icons.multiline_chart))
          ],
        );
      }),
    );
  }
}
