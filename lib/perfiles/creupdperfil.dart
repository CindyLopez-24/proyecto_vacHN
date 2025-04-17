import 'package:flutter/material.dart';

class CreUpdPerfil extends StatefulWidget {
  const CreUpdPerfil({super.key});

  @override
  State<CreUpdPerfil> createState() => _CreUpdPerfilState();
}

class _CreUpdPerfilState extends State<CreUpdPerfil> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController fechanacimientoController =
      TextEditingController();
  final TextEditingController dniController = TextEditingController();
  final TextEditingController sexoController = TextEditingController();
  final TextEditingController departamentoController = TextEditingController();
  final TextEditingController municipioController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear/Actualizar Perfil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: nombreController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: fechanacimientoController,
                keyboardType: TextInputType.datetime,
                decoration:
                    const InputDecoration(labelText: 'Fecha de Nacimiento'),
              ),
              TextField(
                controller: dniController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'DNI'),
              ),
              TextField(
                controller: sexoController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Sexo'),
              ),
              TextField(
                controller: departamentoController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Departamento'),
              ),
              TextField(
                controller: municipioController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Municipio'),
              ),
              TextField(
                controller: direccionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Dirección'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
