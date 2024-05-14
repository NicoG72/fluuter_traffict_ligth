import 'package:flutter/material.dart';
import 'package:semaforo_test/components/spacer_widget.dart.dart';
import 'package:semaforo_test/components/text_widget.dart';
import '../components/carousel_ppal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          CarouselPpal(
            300,
          ),
          SpacerWidget(15),
          TextEditable(
            'Bienvenido',
            size: 25,
          ),
          SpacerWidget(15),
          TextEditable(
            'Para dirigirte a la pantalla de juego puedes hacerlo desde el button o desde el menu lateral.',
            size: 15,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/game',
            );
          },
          backgroundColor: Colors.green,
          child: Icon(Icons.arrow_right_alt, color: Colors.white)),
    );
  }
}
