import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import '../provider/semaforo_provider.dart';
import './car.dart';

class Ligths extends StatefulWidget {
  const Ligths({super.key});

  @override
  State<Ligths> createState() => _LigthsState();
}

class _LigthsState extends State<Ligths> {
  int indexLigth = 0;
  late Timer _timer;
  late Timer _timerCar;
  bool ligthClicked = false;
  int positionCar = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _moveCar();
    _compareIndexes();
  }

  @override
  void dispose() {
    _timer.cancel();
    _timerCar.cancel();
    super.dispose();
  }

//funciones de semaforo

  void _startTimer() {
    final semaforo = Provider.of<SemaforoProvider>(context, listen: false);
    final light = semaforo.semaforo[indexLigth];

    _timer = Timer.periodic(Duration(milliseconds: light.changeTime), (timer) {
      _incrementIndex(semaforo.semaforo.length);
      _compareIndexes();
    });
  }

  void _incrementIndex(int listLength) {
    setState(() {
      indexLigth = (indexLigth + 1) % listLength;
    });
  }

  void _compareIndexes() {
    final semaforo = Provider.of<SemaforoProvider>(context, listen: false);

    if (positionCar == 100) {
      _resetData();
    } else {
      for (int i = 0; i < semaforo.semaforo.length; i++) {
        final light = semaforo.semaforo[i];
        if (i == indexLigth) {
          setState(() {
            light.onOff = true;
          });
          if (light.nameIndex == "verde") {
            _moveCar();
          } else {
            _stopCar();
          }
        } else {
          setState(() {
            light.onOff = false;
          });
        }
      }
    }
  }

  void _toggleLightState(int idx) {
    final semaforo = Provider.of<SemaforoProvider>(context, listen: false);
    if (!ligthClicked) {
      if (idx != 1) {
        setState(() {
          for (int i = 0; i < semaforo.semaforo.length; i++) {
            final light = semaforo.semaforo[i];
            light.onOff = i == idx ? !light.onOff : false;
          }
          indexLigth = idx;
          ligthClicked = true;
          if (semaforo.semaforo[idx].nameIndex == "verde") {
            _moveCar();
          } else {
            _stopCar();
          }
        });
        Timer(Duration(seconds: semaforo.semaforo[idx].changeTime), () {
          _compareIndexes();
          _incrementIndex(semaforo.semaforo.length);
        });
      }
    } else {
      _timerClick();
    }
  }

  void _timerClick() {
    if (ligthClicked) {
      _timer = Timer(const Duration(seconds: 5), () {
        setState(() {
          ligthClicked = false;
        });
      });
    }
  }

  //Funciones para movimiento de auto

  void _positionOfCar() {
    setState(() {
      if (positionCar < 100) {
        positionCar = positionCar + 1;
      }
    });
  }

  void _moveCar() {
    _timerCar = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      _positionOfCar();
    });
  }

  void _stopCar() {
    _timerCar.cancel();
  }

  // funcion para el reinicio de app

  void _resetData() {
    final semaforo = Provider.of<SemaforoProvider>(context, listen: false);

    setState(() {
      indexLigth = -1;
      _timer.cancel();
      _timerCar.cancel();
      ligthClicked = true;
      for (int i = 0; i < semaforo.semaforo.length; i++) {
        semaforo.semaforo[i].onOff = false;
      }
    });
  }
  // funcion para controlar el value de postionCar

  void addVelocity() {
    setState(() {
      positionCar = positionCar + 1;
    });
  }

  void lessVelocity() {
    setState(() {
      positionCar = positionCar + 1;
    });
  }

  void onChangeVelociy() {}

  //funcionalida de pausar la app

  @override
  Widget build(BuildContext context) {
    final semaforo = Provider.of<SemaforoProvider>(context);

    return ListView(
      children: [
        SizedBox(
          height: 50 * semaforo.semaforo.length.toDouble(),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: semaforo.semaforo.length,
            itemBuilder: (context, index) {
              final light = semaforo.semaforo[index];
              return LightCircle(
                light: light,
                onTap: () {
                  _toggleLightState(index);
                },
              );
            },
          ),
        ),
        Car(positionPercentage: positionCar),
      ],
    );
  }
}

class LightCircle extends StatelessWidget {
  final Lights light;
  final VoidCallback onTap;

  const LightCircle({
    super.key,
    required this.light,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = light.onOff
        ? Color(int.parse("0xFF${light.colorOn}"))
        : Color(int.parse("0xFF${light.colorOff}"));

    return Container(
      margin: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}
