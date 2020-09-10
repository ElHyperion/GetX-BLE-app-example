import 'package:get/get.dart';
import 'package:ble_app/services/ble_service.dart';
import 'package:ble_app/service_locator.dart';

class BluetoothController extends GetxController {
  final BLEService _ble = locator<BLEService>();

  final connected = false.obs;

  void connect() => _ble.connect();

  @override
  void onInit() => connected.bindStream(_ble.isConnected);
}
