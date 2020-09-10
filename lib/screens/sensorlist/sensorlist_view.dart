import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ble_app/screens/sensorlist/sensorlist_controller.dart';

class SensorListView extends GetView<SensorListController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<ListTile> items = [];
      int i = 1;
      for (int sensor in controller.sensors) {
        i++;
        items.add(ListTile(
          title: Text('Sensor $i'),
          subtitle: Text(sensor.toString()),
        ));
      }
      return ListView(children: items);
    });
  }
}
