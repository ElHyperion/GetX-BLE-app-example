import 'dart:async';
import 'package:get/get.dart';
import 'package:ble_app/service_locator.dart';
import 'package:ble_app/services/ble_service.dart';

class SensorListController extends GetxController {
  final BLEService _ble = locator<BLEService>();

  RxList sensors = [].obs;
  StreamSubscription<List<int>> _datasub;

  @override
  void onInit() {
    _datasub = _ble.getData.listen(_updateSensors);
    super.onInit();
  }

  @override
  Future<void> onClose() {
    _datasub.cancel();
    return super.onClose();
  }

  void _updateSensors(List<int> _sensors) {
    print('Updated ${_sensors.length} sensors');
    if (!_sensors.isNull) {
      sensors.clear();
      for (int sensor in _sensors) sensors.add(sensor);
    }
  }
}
