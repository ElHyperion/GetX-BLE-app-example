import 'dart:async';

abstract class BLEService {
  /// Toggles the connection state.
  void connect();

  /// Returns a boolean stream, true if connected to any device.
  Stream<bool> get isConnected;

  /// Returns a sensor stream if connected.
  Stream<List<int>> get getData;
}
