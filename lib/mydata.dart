import 'package:flutter/cupertino.dart';

class MyData with ChangeNotifier {
  String balance = '200.000.00';
  bool userActive = false;
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners(); // Notify listeners about the change
  }

  void updateBalance(String balance) {
    balance = balance;
    notifyListeners(); // Notify listeners about the change
  }
  void updateUserStatus(bool userActive) {
    userActive = userActive;
    notifyListeners(); // Notify listeners about the change
  }
}