import 'package:get/get.dart';
import 'package:ble_app/screens/bluetooth/bluetooth_controller.dart';
import 'package:ble_app/screens/bluetooth/bluetooth_view.dart';
import 'package:ble_app/screens/home/home_controller.dart';
import 'package:ble_app/screens/home/home_view.dart';

part 'routes.dart';

List<GetPage> routes = [
  GetPage(
    name: Routes.HomeRoute,
    page: () => HomeView(),
    binding: BindingsBuilder(
      () => Get.lazyPut<HomeController>(() => HomeController()),
    ),
  ),
  GetPage(
    name: Routes.BluetoothRoute,
    page: () => BluetoothView(),
    binding: BindingsBuilder(
      () => Get.lazyPut<BluetoothController>(() => BluetoothController()),
    ),
    transition: Transition.leftToRightWithFade,
    transitionDuration: Duration(milliseconds: 200),
  ),
];
