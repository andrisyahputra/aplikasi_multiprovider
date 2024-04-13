import 'package:flutter/material.dart';

class Warna with ChangeNotifier{
  Color warnaValue(warna){
    return Color.fromARGB(warna, 204, 220, 57);
  }
}