import 'package:flutter/material.dart';

class Counter2 extends ChangeNotifier {
  int _count = 0;
  int get count2 => _count;
  int get add => _count + _count;
  int get multi => _count * _count;

  void increment2() {
    _count = _count + 2;
    notifyListeners();
  }

  Future<String> get fetchName {
    final name = Future.delayed(Duration(seconds: 2), () {
      return "Cristian Brunone";
    });
    return name;
  }

  Stream<int> counterForOneMinute() async* {
    for (int i = 1; i <= 60; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }
}
