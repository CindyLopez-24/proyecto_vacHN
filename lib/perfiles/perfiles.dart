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
      'edad': 35,
      'dni': '12345678',
      'sexo': 'Masculino',
      'departamento': 'Yoro',
      'municipio': 'Morazán',
      'direccion': 'Av. Ejemplo 123',
      'vacunas': [
        {'nombre': 'COVID-19', 'fecha': '01/01/2022'},
        {'nombre': 'Influenza', 'fecha': '15/11/2021'},
        {'nombre': 'Hepatitis B', 'fecha': '10/07/2019'},
      ],
    },
    {
      'nombre': 'María López',
      'edad': 28,
      'dni': '87654321',
      'sexo': 'Femenino',
      'departamento': 'Cortes',
      'municipio': 'San Pedro Sula',
      'direccion': 'Calle Ejemplo 456',
      'vacunas': [
        {'nombre': 'COVID-19', 'fecha': '01/02/2022'},
        {'nombre': 'Tétano', 'fecha': '20/05/2020'},
      ],
    },
    {
      'nombre': 'Carlos García',
      'edad': 45,
      'dni': '13579246',
      'sexo': 'Masculino',
      'departamento': 'Lempira',
      'municipio': 'Gracias',
      'direccion': 'Av. Ejemplo 789',
      'vacunas': [
        {'nombre': 'COVID-19', 'fecha': '01/03/2022'},
        {'nombre': 'Sarampión', 'fecha': '15/08/2018'},
        {'nombre': 'Rubéola', 'fecha': '10/12/2017'},
      ],
    },
    {
      'nombre': 'Ana Torres',
      'edad': 30,
      'dni': '24681357',
      'sexo': 'Femenino',
      'departamento': 'Colón',
      'municipio': 'Tocoa',
      'direccion': 'Calle Ejemplo 321',
      'vacunas': [
        {'nombre': 'COVID-19', 'fecha': '01/04/2022'},
        {'nombre': 'Varicela', 'fecha': '20/09/2019'},
        {'nombre': 'Fiebre Amarilla', 'fecha': '10/11/2018'},
      ],
    },
    {
      'nombre': 'Luis Martínez',
      'edad': 50,
      'dni': '98765432',
      'sexo': 'Masculino',
      'departamento': 'Francisco Morazán',
      'municipio': 'Tegucigalpa',
      'direccion': 'Av. Ejemplo 654',
      'vacunas': [
        {'nombre': 'COVID-19', 'fecha': '01/05/2022'},
        {'nombre': 'Tétano', 'fecha': '15/02/2020'},
        {'nombre': 'Hepatitis A', 'fecha': '10/06/2019'},
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
                      Text('Edad: ${selectedPerfil!['edad']} años'),
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
                // Acción para crear perfil de adulto
              },
              icon: const Icon(Icons.person),
              label: const Text('Crear Perfil de Adulto'),
            ),
            //const SizedBox(height: 8.0),
            ElevatedButton.icon(
              onPressed: () {
                // Acción para crear perfil de niño
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
