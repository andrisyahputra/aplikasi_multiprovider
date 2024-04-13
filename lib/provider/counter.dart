import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int counterValue = 255;

  void increment(){
    if(counterValue >= 255){
    counterValue = 255;
    } else {
    counterValue += 5;
    }
    notifyListeners();
  }
  void decrement(){
    if (counterValue <= 0) {
      counterValue = 0;
    } else {
      counterValue -= 5;
    }
    notifyListeners();
  }
}