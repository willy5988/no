import 'package:flutter/material.dart';

class DataCenter extends ChangeNotifier {
  static final DataCenter instance = DataCenter._internal();

  factory DataCenter() => instance;

  DataCenter._internal();

  int nowSec = 0; //homeScreenNowSec

  void upDate() {
    notifyListeners();
  }
}

final dc = DataCenter();
