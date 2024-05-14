import 'package:flutter/material.dart';

class Lights {
  String colorOn;
  String colorOff;
  String nameIndex;
  bool onOff;
  int changeTime;

  Lights(
      this.colorOff, this.colorOn, this.nameIndex, this.onOff, this.changeTime);
}

class SemaforoProvider extends ChangeNotifier {
  final List<Lights> _semaforo = [
    Lights("660000", "FF0000", "rojo", false, 5000),
    Lights("666600", "FFFF00", "amarillo", false, 2500),
    Lights("006600", "00FF00", "verde", false, 4500),
  ];

  List<Lights> get semaforo => _semaforo;
}
