import 'package:flutter/material.dart';

class Addition extends ChangeNotifier{
  int value = 1;
  increment(){
    value++;
    notifyListeners();
  }
}