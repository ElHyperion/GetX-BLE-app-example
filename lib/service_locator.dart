import 'package:get_it/get_it.dart';
import 'package:ble_app/services/ble_service.dart';
import 'package:ble_app/services/ble_fake_service.dart';

final GetIt locator = GetIt.I;

void setupLocator() async {
  locator.registerSingleton<BLEService>(BleFakeService.getInstance());
}
