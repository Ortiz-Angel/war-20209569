import 'package:flutter/material.dart';
import 'diary_entry_page.dart';
import 'acerca_de.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'War 20209569',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DiaryEntryPage(),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'War 20209569',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DiaryEntryPage(),
      routes: {
        '/acerca_de': (context) => AcercaDePage(), // Ruta para la pantalla "Acerca de"
      },
    );
  }
