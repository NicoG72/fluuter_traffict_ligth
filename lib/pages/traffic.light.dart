import 'package:flutter/material.dart';
import '../components/ligths.dart';

class TraffiLight extends StatefulWidget {
  const TraffiLight({super.key});

  @override
  State<TraffiLight> createState() => _TraffiLightState();
}

class _TraffiLightState extends State<TraffiLight> {
  @override
  Widget build(BuildContext context) {
    return const Ligths();
  }
}
