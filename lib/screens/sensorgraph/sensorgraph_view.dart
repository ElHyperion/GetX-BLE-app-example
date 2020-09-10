import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'sensorgraph_controller.dart';

class SensorGraphView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SensorGraphController>(builder: (c) {
      return Text('Sensor graph');
    });
  }
}
