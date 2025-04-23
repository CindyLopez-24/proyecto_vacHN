import 'package:flutter/material.dart';
import 'package:app_vacunas/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Vacunate HN',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),

      home: RegistroPage(),
    );
  }
  
  }
