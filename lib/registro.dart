<<<<<<< HEAD
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
=======
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputFields(context),
              _loginInstead(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(context) {
    return Column(
      children: [
        Text(
          "Regístrate en VacunateHN",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text("Crea una nueva cuenta"),
      ],
    );
  }

  Widget _inputFields(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Nombre de usuario",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "Correo electrónico",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.email),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Contraseña",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.lock),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Aquí puedes agregar la lógica de registro
          },
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text("Registrarse"),
        ),
      ],
    );
  }

  Widget _loginInstead(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("¿Ya tienes una cuenta?"),
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla de Login
          },
          child: Text("Inicia sesión"),
        ),
      ],
    );
  }
}
>>>>>>> 8d55b8e1308fb4acf4f7c22102c603c9831b2811
