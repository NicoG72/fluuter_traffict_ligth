import 'package:flutter/material.dart';

class SpacerWidget extends StatelessWidget {
  final double value;

  const SpacerWidget(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value);
  }
}
