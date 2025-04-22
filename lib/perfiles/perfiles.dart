import 'package:app_vacunas/perfiles/perfilcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PerfilVacunas extends StatefulWidget {
  const PerfilVacunas({super.key});

  @override
  State<PerfilVacunas> createState() => _PerfilVacunasState();
}

class _PerfilVacunasState extends State<PerfilVacunas> {
  final PerfilController perfilController = Get.find<PerfilController>();

  Map<String, dynamic>? extra;
  String? selectedValue;
  Map<String, dynamic>? selectedPerfil;

  @override
  void initState() {
    super.initState();
    extra = GoRouter.of(context).state.extra as Map<String, dynamic>?;
    selectedPerfil = perfilController.perfiles[0];
    selectedValue = selectedPerfil!['dni'];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    extra = GoRouter.of(context).state.extra as Map<String, dynamic>?;
    if (extra != null && extra!["editar"]) {
      selectedPerfil = extra!['perfil'];
      selectedValue = selectedPerfil!['dni'];

      final nuevoPerfil = extra!['perfil'] as Map<String, dynamic>;

      final index = perfilController.perfiles
          .indexWhere((p) => p['dni'] == nuevoPerfil['dni']);
      if (index != -1) {
        perfilController.perfiles[index] = nuevoPerfil;
      }
      if (extra!['nuevavacuna'] != null) {
        perfilController.perfiles[index]['vacunas']
            .add(extra!['nuevavacuna'].toMap());
        //perfilController.perfiles[index]['vacunas'][0] = extra!['nuevavacuna'];
      }
    }
    if (extra != null && extra!["editar"] == false) {
      perfilController.perfiles.add(extra!['perfil'] as Map<String, dynamic>);
      selectedPerfil = extra!['perfil'] as Map<String, dynamic>;
      selectedValue = selectedPerfil!['dni'];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('PERFIL DE VACUNAS'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Perfil del Usuario',
            ),
/////////////////////////MOSTRAR/SELECCIONAR PERFILES////////////////////////////
            DropdownButton<String>(
              value: selectedPerfil!['dni'],
              hint: const SizedBox(
                width: 400,
                child: Card(
                  color: Color.fromARGB(255, 83, 178, 247),
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
              items: perfilController.perfiles.map((value) {
                return DropdownMenuItem<String>(
                  value: value['dni'],
                  child: SizedBox(
                    width: 400,
                    child: Card(
                      color: const Color.fromARGB(255, 83, 178, 247),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              value["tipo"] == "mayor de 5 años"
                                  ? Icons.person
                                  : Icons.child_care,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              value['nombre'],
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPerfil = perfilController.perfiles.firstWhere(
                    (perfil) => perfil['dni'] == value,
                  );
                  selectedValue = selectedPerfil!['dni'];
                });
              },
            ),
            InkWell(
              onTap: () {},
///////////////////////////////////MOSTRAR PERFIL////////////////////////////////////
              child: Card(
                color: Colors.lightBlueAccent,
                child: ListTile(
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
/////////////////////////////////////EDITAR PERFIL///////////////////////////////////////
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      context.go('/perfilvacunas/creupdperfil',
                          extra: {"perfil": selectedPerfil!, "editar": true});
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6.0),
            const Text(
              'Vacunas Registradas',
            ),
            const SizedBox(height: 4.0),
//////////////////////////////////MOSTRAR VACUNAS////////////////////////////////////
            Expanded(
              child: ListView.builder(
                itemCount: selectedPerfil!['vacunas'].length,
                itemBuilder: (context, index) {
                  final vacuna = selectedPerfil!['vacunas'][index];
                  return SizedBox(
                      height: 70,
                      child: Card(
                        color: Colors.lightBlueAccent,
                        child: ListTile(
                          title: Text(
                            vacuna['nombre'],
                          ),
                          subtitle: Text(
                              'Fecha: ${DateFormat('dd-MM-yyyy').format(vacuna['grupo'][0].values.first['fecha'])}'),
                          onTap: () {},
                          trailing: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              if (vacuna['grupo'][0]
                                      .values
                                      .first['pendientes'] ==
                                  0) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Vacuna Completada"),
                                      content: const Text(
                                          "Esta vacuna ya ha sido completada."),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return;
                              } else {
                                selectedPerfil!['vacunas'][index]['grupo'][0]
                                    .values
                                    .first['completadas'] += 1;
                                selectedPerfil!['vacunas'][index]['grupo'][0]
                                    .values
                                    .first['pendientes'] -= 1;
                                perfilController.perfiles[perfilController
                                        .perfiles
                                        .indexWhere((p) =>
                                            p['dni'] == selectedPerfil!['dni'])]
                                    ['vacunas'][index]['grupo'][0];
                                selectedPerfil = perfilController.perfiles[
                                    perfilController.perfiles.indexWhere((p) =>
                                        p['dni'] == selectedPerfil!['dni'])];
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      ));
                },
              ),
            ),
            const SizedBox(height: 4.0),
/////////////////////////////////AÑADIR VACUNA////////////////////////////////////
            SizedBox(
              width: 400,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 83, 178, 247)),
                ),
                icon: const Icon(
                  Icons.vaccines,
                  color: Colors.deepPurple,
                ),
                label: const Text(
                  'Registrar Nueva Vacuna',
                  style: TextStyle(color: Colors.black87),
                ),
                onPressed: () {
                  context.go('/perfilvacunas/addvacuna',
                      extra: {"perfil": selectedPerfil!, "editar": true});
                },
              ),
            ),
/////////////////////////////////////////GRAFICO////////////////////////////////////
            SizedBox(
              width: 400,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 83, 178, 247)),
                ),
                icon: const Icon(
                  Icons.bar_chart,
                  color: Colors.deepPurple,
                ),
                label: const Text(
                  'Grafico de Esquema de Vacunación',
                  style: TextStyle(color: Colors.black87),
                ),
                onPressed: () {
                  context.go(
                    '/perfilvacunas/grafico',
                    extra: selectedPerfil,
                  );
                },
              ),
            ),
            const SizedBox(height: 4.0),
            const Text(
              'Administrar Perfiles',
            ),
            const SizedBox(height: 4.0),
//////////////////////////////AÑADIR PERFIL////////////////////////////////////
            SizedBox(
              width: 400,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 83, 178, 247))),
                onPressed: () {
                  context.go('/perfilvacunas/creupdperfil',
                      extra: {"editar": false, "tipo": "Adulto"});
                },
                icon: const Icon(Icons.person),
                label: const Text(
                  'Crear Perfil de Mayor de 5 años',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
            SizedBox(
              width: 400,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 83, 178, 247))),
                onPressed: () {
                  context.go('/perfilvacunas/creupdperfil',
                      extra: {"editar": false, "tipo": "Niño"});
                },
                icon: const Icon(Icons.child_care),
                label: const Text(
                  'Crear Perfil de Menor de 5 años',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
