import 'package:app_vacunas/homePage.dart';
import 'package:app_vacunas/login.dart';
import 'package:app_vacunas/registro.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
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

      initialRoute: '/login',
      routes: {
          '/login': (context) => const LoginPage(),
          '/registro': (context) => const RegisterPage(),
          //'/inicio':
        },
        
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const LoginPage(),
          );
        },
    );
  }
}