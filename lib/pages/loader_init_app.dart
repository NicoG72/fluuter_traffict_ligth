import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class InitPageApp extends StatefulWidget {
  const InitPageApp({super.key});

  @override
  State<InitPageApp> createState() => _InitPageAppState();
}

class _InitPageAppState extends State<InitPageApp> {
  late Timer _timer;
  double _valueWidth = 100;
  double _valueHeight = 150;
  Color _color = Colors.blue;
  BorderRadius _borderRadius = BorderRadius.circular(10);

  //funciones de animacion para load page
  void _changeForm() {
    final random = Random();
    _valueWidth = random.nextInt(350).toDouble();
    _valueHeight = random.nextInt(350).toDouble();
    _color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    _borderRadius = BorderRadius.circular(random.nextInt(25).toDouble());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick <= 5000) {
        _changeForm();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: _valueWidth,
            height: _valueHeight,
            decoration:
                BoxDecoration(color: _color, borderRadius: _borderRadius)));
  }
}
