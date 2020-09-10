import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'sensorblocks_controller.dart';

class SensorBlocksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SensorBlocksController>(builder: (c) {
      return GridView.extent(
        primary: false,
        maxCrossAxisExtent: 350,
        children: List.generate(
          8,
          (index) => Card(
            child: InkWell(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: const FlutterLogo(),
                    ),
                  ),
                  Text('Sensor $index', style: TextStyle(fontSize: 22))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
