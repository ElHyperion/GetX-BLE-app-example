import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ble_app/service_locator.dart';
import 'package:ble_app/router/pages.dart';

import 'screens/sensorlist/sensorlist_controller.dart';
import 'screens/sensorblocks/sensorblocks_controller.dart';
import 'screens/sensorgraph/sensorgraph_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => SensorListController(), fenix: true);
  Get.lazyPut(() => SensorBlocksController(), fenix: true);
  Get.lazyPut(() => SensorGraphController(), fenix: true);
  setupLocator();
  runApp(AppMain());
}

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
      title: 'BLE App', initialRoute: Routes.HomeRoute, getPages: routes);
}
