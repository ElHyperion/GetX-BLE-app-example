import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ble_app/service_locator.dart';
import 'package:ble_app/services/ble_service.dart';

class HomeController extends GetxController {
  final BLEService _ble = locator<BLEService>();
  StreamSubscription<bool> _isConnectedSub;

  final index = 0.obs;
  final connected = false.obs;
  PageController pageController;

  @override
  void onInit() {
    _isConnectedSub = _ble.isConnected.listen((event) {
      connected.value = event;
      if (connected.value && pageController.isNull)
        pageController =
            PageController(initialPage: index.value, keepPage: true);
      update();
    });
    super.onInit();
  }

  @override
  Future<void> onClose() {
    _isConnectedSub.cancel();
    if (!pageController.isNull) pageController.dispose();
    return super.onClose();
  }

  void onBarTap(int _index) {
    index.value = _index;
    if (!pageController.isNull && pageController.hasClients) {
      pageController.animateToPage(
        _index,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }

  void onPageChanged(int _index) => index.value = _index;

  void onConnectTap() => _ble.connect();
}
