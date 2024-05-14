import 'package:flutter/material.dart';

class Car extends StatelessWidget {
  final int positionPercentage;

  const Car({super.key, required this.positionPercentage});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double positionInPixels =
        (screenWidth * positionPercentage / 100).toDouble();

    return Container(
      height: 100,
      color: Colors.blueGrey,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            left: positionInPixels,
            bottom: 50,
            child: Container(
              width: 40,
              height: 20,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
