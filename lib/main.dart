import 'package:app_vacunas/login.dart';
import 'package:flutter/material.dart';
//import 'package:app_vacunas/registro.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vacunate HN',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),

      home: const LoginPage(),
    );
  }
}