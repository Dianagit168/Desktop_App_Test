import 'package:flutter/material.dart';

class CarrierProvider extends ChangeNotifier {
  String _carrierName = '';
  String get carrierName => _carrierName;
  void changeCarrier(String newCarrier) {
    _carrierName = newCarrier;

    notifyListeners();
  }
}
