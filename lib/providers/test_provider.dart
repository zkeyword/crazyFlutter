import 'package:flutter/material.dart';

class TestProvider with ChangeNotifier {
  String _val = '111';
  String get val => _val;

  void setVal(String v) {
    _val = v;
    notifyListeners();
  }
}
