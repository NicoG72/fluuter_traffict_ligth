import 'package:flutter/material.dart';
import '../components/text_widget.dart';

class CustomStrutureApp extends StatefulWidget {
  final Widget child;
  const CustomStrutureApp(this.child, {super.key});

  @override
  State<CustomStrutureApp> createState() => _CustomStrutureAppState();
}

class _CustomStrutureAppState extends State<CustomStrutureApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 2, 71),
        title: const Center(
          child: TextEditable(
            'Traffic Light Game',
            colorHex: 'FFFFFF',
            size: 20,
            position: 'center',
          ),
        ),
      ),
      body: widget.child,
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () async {
                await Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text('Game'),
              onTap: () async {
                await Navigator.pushNamed(context, '/game');
              },
            ),
          ],
        ),
      ),
    );
  }
}
