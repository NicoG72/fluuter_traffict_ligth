import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './menu/custom_structure_app.dart';
import './pages/traffic.light.dart';
import './provider/semaforo_provider.dart';
import 'pages/home_page.dart';
import 'pages/loader_init_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SemaforoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<void> _initialWait;
  bool _firstLaunch = true;

  @override
  void initState() {
    super.initState();
    _initialWait = Future.delayed(const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder(
              future: _firstLaunch ? _initialWait : Future.value(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  _firstLaunch = false;
                  return const CustomStrutureApp(HomePage());
                } else {
                  return const InitPageApp();
                }
              },
            ),
        '/game': (context) => const CustomStrutureApp(TraffiLight()),
      },
    );
  }
}
