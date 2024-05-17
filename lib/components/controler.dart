// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:semaforo_test/components/text_widget.dart';

// ignore: must_be_immutable
class ControlerWidget extends StatefulWidget {
  final VoidCallback onIncreaseSpeed;
  final VoidCallback onDecreaseSpeed;
  int velocity;

  ControlerWidget({
    super.key,
    required this.onIncreaseSpeed,
    required this.onDecreaseSpeed,
    required this.velocity,
  });

  @override
  State<ControlerWidget> createState() => _ControlerWidgetState(
      onIncreaseSpeed: onIncreaseSpeed, onDecreaseSpeed: onDecreaseSpeed);
}

class _ControlerWidgetState extends State<ControlerWidget> {
  final VoidCallback onIncreaseSpeed;
  final VoidCallback onDecreaseSpeed;

  _ControlerWidgetState(
      {required this.onIncreaseSpeed, required this.onDecreaseSpeed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextEditable(
          'Control de velocidad',
        ),
        Row(
          children: [
            _buttonMoreSpeed(),
            SizedBox(
              width: 100.0,
              child: Center(
                child: Text('${widget.velocity}'),
              ),
            ),
            _buttonSlowDown(),
          ],
        ),
      ],
    );
  }

  Widget _buttonMoreSpeed() {
    return ElevatedButton(
      onPressed: onIncreaseSpeed,
      child: const Icon(Icons.add),
    );
  }

  Widget _buttonSlowDown() {
    return ElevatedButton(
      onPressed: onDecreaseSpeed,
      child: const Icon(Icons.remove),
    );
  }
}
