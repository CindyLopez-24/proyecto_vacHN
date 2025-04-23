//registrar nuevo usuario
import 'package:flutter/material.dart';
import 'package:app_vacunas/custom_input.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});
 
 @override
 Widget build(BuildContext context) {

  final TextEditingController nombreController = TextEditingController();
    final TextEditingController nacimientoController = TextEditingController();
    final TextEditingController dniController = TextEditingController();
    final TextEditingController sexoController = TextEditingController();
    final TextEditingController departamentoController = TextEditingController();
    final TextEditingController municipioController = TextEditingController();
    final TextEditingController direccionController = TextEditingController();
    
  return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volver a la página de inicio de sesión
          },
        ),
        title: const Text("Registro"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0),
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.teal,
          Colors.blue,
        ])),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 0,
                  ),
                  Text(
                    "Vacunate HN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.lightBlue,
                    child: Icon(
                      Icons.pets,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Text(
                    "Bienvenido a tu app de vacunas",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "Registra tus datos",
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 25,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(12, 164, 157, 0.552),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              CustomInput(
                                title: 'Nombre Completo ',
                                icon: Icons.person,
                                controller: nombreController,
                              ),
                              CustomInput(
                                title: 'Fecha de nacimiento',
                                icon: Icons.calendar_today,
                                controller: nacimientoController,
                              ),
                              CustomInput(
                                title: 'DNI',
                                icon: Icons.person,
                                controller: dniController,
                              ),
                              CustomInput(
                                title: 'Sexo',
                                icon: Icons.category,
                                controller: sexoController,
                              ),
                              CustomInput(
                                title: 'Departamento',
                                icon: Icons.location_pin,
                                controller: departamentoController,
                              ),
                              CustomInput(
                                title: 'Municipio',
                                icon: Icons.map,
                                controller: municipioController,
                              ),
                              CustomInput(
                                title: 'Direccion',
                                icon: Icons.home,
                                controller: direccionController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                       ],
        ),
      ),
                ),
              ),
        ),],
        ),
      ),
    );
 }
}             
