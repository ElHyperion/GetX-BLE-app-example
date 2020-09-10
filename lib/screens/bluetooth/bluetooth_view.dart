import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bluetooth_controller.dart';

class BluetoothView extends StatelessWidget {
  final c = Get.find<BluetoothController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bluetooth connections')),
      body: Center(
        child: RaisedButton(
          child: Obx(() => Text(c.connected.value ? 'Disconnect' : 'connect')),
          onPressed: c.connect,
        ),
      ),
    );
  }
}
