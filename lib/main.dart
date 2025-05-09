import 'package:app_vacunas/firebase_options.dart';
import 'package:app_vacunas/homePage.dart';
//import 'package:app_vacunas/login.dart';
import 'package:app_vacunas/perfiles/addvacuna.dart';
import 'package:app_vacunas/perfiles/creupdperfil.dart';
import 'package:app_vacunas/perfiles/graficoesquemavacunacion.dart';
import 'package:app_vacunas/perfiles/logout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_vacunas/perfiles/perfilcontroller.dart';
import 'package:get/get.dart';
import 'package:app_vacunas/perfiles/perfiles.dart';
import 'package:go_router/go_router.dart';
import 'package:app_vacunas/perfiles/authcontroller.dart';
//import 'package:app_vacunas/registro.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Get.put(AuthController());
    AuthController authController = Get.find<AuthController>();
    Get.put(PerfilController());
    await authController.signInWithGoogle();
    PerfilController perfilController = Get.find<PerfilController>();
    perfilController.uid = FirebaseAuth.instance.currentUser?.uid;
    perfilController.perfiles =
        await perfilController.obtenerPerfilesDesdeFirestore();

    runApp(const MyApp());
  } catch (e) {
    runApp(ErrorPage(errorMessage: e.toString()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routerConfig: GoRouter(
          initialLocation: '/perfilvacunas',
          routes: [
            GoRoute(
              path: '/perfilvacunas',
              builder: (context, state) => const PerfilVacunas(),
              routes: [
                GoRoute(
                    path: 'creupdperfil',
                    builder: (context, state) => const CreUpdPerfil()),
                GoRoute(
                    path: 'homepage',
                    builder: (context, state) => HomeMenu(
                          currentPage: 1,
                          changePage: (int index) {
                            // Handle page change here
                          },
                        )),
              ],
            ),
            GoRoute(
                path: '/LogOut', builder: (context, state) => const LogOut()),
            GoRoute(
                path: '/grafico',
                builder: (context, state) => const GraficoEsquemasVac()),
            GoRoute(
                path: '/addvacuna',
                builder: (context, state) => const AddVacuna()),
          ],
        ));
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Error',
        home: Scaffold(
          backgroundColor: Colors.deepPurpleAccent,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Error: $errorMessage',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ));
  }
}
