import 'package:flutter/foundation.dart';

class FruitProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    count == 0 ? 0 : _count--;

    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}
