import 'package:app_vacunas/login.dart';
import 'package:flutter/material.dart';
import 'package:app_vacunas/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    // TODO: implement build
    return MaterialApp(
      title: 'Vacunate HN',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),

      home: RegistroPage(),
    );
  }
  
=======
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VacunateHN',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
>>>>>>> 8d55b8e1308fb4acf4f7c22102c603c9831b2811
  }
