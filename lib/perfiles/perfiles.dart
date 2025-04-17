import 'package:app_vacunas/perfiles/creupdperfil.dart';
import 'package:flutter/material.dart';

class PerfilVacunas extends StatefulWidget {
  const PerfilVacunas({super.key});

  @override
  State<PerfilVacunas> createState() => _PerfilVacunasState();
}

class _PerfilVacunasState extends State<PerfilVacunas> {
  final List<Map<String, dynamic>> perfiles = [
    {
      'nombre': 'Juan Pérez',
      'fecha de nacimiento': DateTime(1990, 1, 1),
      'dni': '12345678',
      'sexo': 'Masculino',
      'departamento': 'Yoro',
      'municipio': 'Morazán',
      'direccion': 'Av. Ejemplo 123',
      'vacunas': [
        {
          'nombre': 'Tétano',
          'fecha': DateTime(2020, 2, 15),
          'Dosis': 5,
          'completadas': 0
        },
        {
          'nombre': 'Difteria',
          'fecha': DateTime(2019, 6, 10),
          'Dosis': 9,
          'completadas': 4
        },
        {
          'nombre': 'Influenza',
          'fecha': DateTime(2020, 1, 10),
          'Dosis': 7,
          'completadas': 6
        },
        {
          'nombre': 'Hepatitis B',
          'fecha': DateTime(2018, 6, 10),
          'Dosis': 3,
          'completadas': 2
        },
        {
          'nombre': 'Varicela',
          'fecha': DateTime(2018, 6, 10),
          'Dosis': 1,
          'completadas': 1
        },
        {
          'nombre': 'Fiebre Amarilla',
          'fecha': DateTime(2018, 6, 10),
          'Dosis': 3,
          'completadas': 1
        },
      ],
    },
    {
      'nombre': 'María López',
      'fecha de nacimiento': DateTime(1985, 5, 15),
      'dni': '87654321',
      'sexo': 'Femenino',
      'departamento': 'Cortes',
      'municipio': 'San Pedro Sula',
      'direccion': 'Calle Ejemplo 456',
      'vacunas': [
        {'nombre': 'Difteria', 'fecha': DateTime(2019, 6, 10)},
        {'nombre': 'Hepatitis A', 'fecha': DateTime(2018, 6, 10)},
        {'nombre': 'Sarampión', 'fecha': DateTime(2018, 6, 10)},
        {'nombre': 'Rubéola', 'fecha': DateTime(2018, 6, 10)},
      ],
    },
    {
      'nombre': 'Carlos García',
      'fecha de nacimiento': DateTime(2000, 8, 20),
      'dni': '13579246',
      'sexo': 'Masculino',
      'departamento': 'Lempira',
      'municipio': 'Gracias',
      'direccion': 'Av. Ejemplo 789',
      'vacunas': [
        {'nombre': 'Sarampión', 'fecha': DateTime(2004, 6, 10)},
        {'nombre': 'Rubéola', 'fecha': DateTime(2004, 6, 10)},
        {'nombre': 'Hepatitis A', 'fecha': DateTime(2004, 6, 10)},
        {'nombre': 'Difteria', 'fecha': DateTime(2004, 6, 10)},
        {'nombre': 'Tétano', 'fecha': DateTime(2004, 6, 10)},
        {'nombre': 'Hepatitis B', 'fecha': DateTime(2004, 6, 10)},
      ],
    },
    {
      'nombre': 'Ana Torres',
      'fecha de nacimiento': DateTime(2015, 3, 10),
      'dni': '24681357',
      'sexo': 'Femenino',
      'departamento': 'Colón',
      'municipio': 'Tocoa',
      'direccion': 'Calle Ejemplo 321',
      'vacunas': [
        {'nombre': 'Neumococo', 'fecha': DateTime(2021, 6, 15)},
        {'nombre': 'Meningococo', 'fecha': DateTime(2020, 1, 10)},
        {'nombre': 'Hepatitis C', 'fecha': DateTime(2020, 2, 15)},
        {'nombre': 'Hepatitis B', 'fecha': DateTime(2019, 6, 10)},
        {'nombre': 'Varicela', 'fecha': DateTime(2018, 6, 10)},
        {'nombre': 'Fiebre Amarilla', 'fecha': DateTime(2018, 6, 10)},
      ],
    },
    {
      'nombre': 'Luis Martínez',
      'fecha de nacimiento': DateTime(1975, 12, 25),
      'dni': '98765432',
      'sexo': 'Masculino',
      'departamento': 'Francisco Morazán',
      'municipio': 'Tegucigalpa',
      'direccion': 'Av. Ejemplo 654',
      'vacunas': [
        {'nombre': 'Neumococo', 'fecha': DateTime(2020, 6, 15)},
        {'nombre': 'Difteria', 'fecha': DateTime(2019, 6, 10)},
        {'nombre': 'Tétano', 'fecha': DateTime(2020, 2, 15)},
        {'nombre': 'Sarampión', 'fecha': DateTime(2018, 6, 10)},
        {'nombre': 'Rubéola', 'fecha': DateTime(2018, 6, 10)},
        {'nombre': 'Fiebre Amarilla', 'fecha': DateTime(2018, 6, 10)},
      ],
    },
  ];
  String? selectedValue;
  Map<String, dynamic>? selectedPerfil;

  @override
  void initState() {
    super.initState();
    selectedPerfil = perfiles[0];
    selectedValue = selectedPerfil!['nombre'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PERFIL DE VACUNAS'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Perfil del Usuario',
            ),
            const SizedBox(height: 16.0),
            // Información del perfil actual
            InkWell(
              onTap: () {},
              child: Card(
                child: ListTile(
                  //title: const Text('Nombre del usuario'),
                  //subtitle: const Text('Ejemplo: Juan Pérez'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nombre: ${selectedPerfil!['nombre']}'),
                      Text(
                          'Edad: ${(DateTime.now().year) - (selectedPerfil!['fecha de nacimiento'].year)} años'),
                      Text('DNI: ${selectedPerfil!['dni']}'),
                      Text('Sexo: ${selectedPerfil!['sexo']}'),
                      Text('Departamento: ${selectedPerfil!['departamento']}'),
                      Text('Municipio: ${selectedPerfil!['municipio']}'),
                      Text('Dirección: ${selectedPerfil!['direccion']}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // Acción para editar perfil
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Vacunas Registradas',
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: selectedPerfil!['vacunas'].length,
                itemBuilder: (context, index) {
                  final vacuna = selectedPerfil!['vacunas'][index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        vacuna['nombre'],
                        //style: const TextStyle(fontSize: 10),
                      ),
                      subtitle: Text('Fecha: ${vacuna['fecha']}'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              icon: const Icon(Icons.vaccines),
              label: const Text('Registrar Nueva Vacuna'),
              onPressed: () {
                // Acción para registrar una nueva vacuna
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Administrar Perfiles',
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedPerfil!['nombre'],
              hint: const SizedBox(
                width: 400,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Seleccionar perfil',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              isExpanded: true,
              items: perfiles.map((value) {
                return DropdownMenuItem<String>(
                  value: value['nombre'],
                  child: SizedBox(
                    width: 400,
                    child: Card(
                      //color: Colors.blue[100],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          value['nombre'],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPerfil = perfiles.firstWhere(
                    (perfil) => perfil['nombre'] == value,
                  );
                  selectedValue = selectedPerfil!['nombre'];
                });
              },
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreUpdPerfil(),
                  ),
                );
              },
              icon: const Icon(Icons.person),
              label: const Text('Crear Perfil de Adulto'),
            ),
            //const SizedBox(height: 8.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreUpdPerfil(),
                  ),
                );
              },
              icon: const Icon(Icons.child_care),
              label: const Text('Crear Perfil de Niño'),
            ),
            //const SizedBox(height: 24.0),
            //const Text(
            //  'Registrar Vacunas',
            //),
            //const SizedBox(height: 16.0),
            //ElevatedButton.icon(
            //  icon: const Icon(Icons.vaccines),
            //  //style: ButtonStyle(
            //  //  backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
            //  //),
            //  onPressed: () {
            //    // Acción para registrar vacunas
            //  },
            //  label: const Text('Registrar Vacunas'),
            //),
          ],
        ),
      ),
    );
  }
}
