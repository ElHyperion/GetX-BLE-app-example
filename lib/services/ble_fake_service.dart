import 'dart:async';
import 'dart:math';

import 'ble_service.dart';

class BleFakeService extends BLEService {
  static BleFakeService _instance;
  static bool _connected = false;
  static StreamController<bool> _connectedStream;
  static StreamController<List<int>> _sensorStream;

  static BleFakeService getInstance() {
    if (_instance == null) {
      _instance = BleFakeService();
      _connectedStream = StreamController<bool>.broadcast();
      _sensorStream = StreamController<List<int>>.broadcast();

      Timer.periodic(Duration(seconds: 1), (Timer t) {
        if (_connected) {
          List<int> _sensors = [];
          int _length = Random().nextInt(10);
          for (var i = 1; i <= _length; i++)
            _sensors.add(Random().nextInt(255));
          _sensorStream.sink.add(_sensors);
        } else {
          _sensorStream.sink.add([]);
        }
      });
    }
    return _instance;
  }

  @override
  void connect() {
    _connected = !_connected;
    _connectedStream.sink.add(_connected);
  }

  @override
  Stream<List<int>> get getData => _sensorStream.stream;

  @override
  Stream<bool> get isConnected => _connectedStream.stream;
}
