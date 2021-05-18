import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';

class DevicesHolder extends ChangeNotifier {
  List<BluetoothDevice> devices = [];
  BluetoothDevice _connectedDevice;

  void changeState(List<BluetoothDevice> state) {
    devices = state;
    notifyListeners();
  }

  void reload() {
    notifyListeners();
  }

  void connect(BluetoothDevice device) {
    _connectedDevice = device;
    _connectedDevice.connected = true;
    notifyListeners();
  }

  void disConnect() {
    _connectedDevice.connected = false;
    _connectedDevice = null;
    notifyListeners();
  }

  bool get connected => _connectedDevice != null;

  String get deviceName =>
      _connectedDevice == null ? "No Device" : _connectedDevice.name;
}
