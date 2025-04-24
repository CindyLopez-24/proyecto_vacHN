import 'package:app_vacunas/perfiles/authcontroller.dart';
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
  final AuthController authController = Get.find<AuthController>();

  Map<String, dynamic>? extra;

  @override
  void initState() {
    super.initState();
    //extra = GoRouter.of(context).state.extra as Map<String, dynamic>?;
    if (perfilController.perfiles.isEmpty) {
      final perfil = {
        'tipo': 'mayor de 5 años',
        'nombre': 'nombre',
        'fecha de nacimiento': '00-00-0000',
        'dni': '00000000',
        'sexo': 'Masculino',
        'departamento': 'Ocotepeque',
        'municipio': 'Concepción',
        'direccion': 'direccion',
        'vacunas': [],
      };
      perfilController.perfiles.add(perfil as Map<String, dynamic>);
    }
    if (perfilController.selectedPerfil == null &&
        perfilController.selectedValue == null) {
      perfilController.selectedPerfil = perfilController.perfiles[0];
      perfilController.selectedValue = perfilController.selectedPerfil!['dni'];
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 142, 183, 253),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('lib/assets/icon/chatgpt_image.png'),
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      'VACUNATE HN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              DropdownButton<String>(
                value: perfilController.selectedPerfil!['dni'],
                hint: const SizedBox(
                  width: 400,
                  child: Card(
                    elevation: 0.0,
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
                        elevation: 0.0,
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
                    perfilController.selectedPerfil =
                        perfilController.perfiles.firstWhere(
                      (perfil) => perfil['dni'] == value,
                    );
                    perfilController.selectedValue =
                        perfilController.selectedPerfil!['dni'];
                  });
                },
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Administrar Perfiles',
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                width: 200,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      elevation: WidgetStateProperty.all(0.0),
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
                width: 200,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      elevation: WidgetStateProperty.all(0.0),
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
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 1,
                  color: Colors.blue,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Cerrar Sesión'),
                onTap: () {
                  authController.signOut();
                  context.pushReplacement('/LogOut');
                },
              ),
            ],
          ),
        ),
      ),
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
///////////////////////////////////MOSTRAR PERFIL////////////////////////////////////
            InkWell(
              onTap: () {},
              child: Card(
                color: Colors.lightBlueAccent,
                child: ListTile(
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Nombre: ${perfilController.selectedPerfil!['nombre']}'),
                      Text(
                          'Edad: ${(DateTime.now().year) - DateFormat('dd-MM-yyyy').parse(perfilController.selectedPerfil!['fecha de nacimiento']).year - 1} años'),
                      Text('DNI: ${perfilController.selectedPerfil!['dni']}'),
                      Text('Sexo: ${perfilController.selectedPerfil!['sexo']}'),
                      Text(
                          'Departamento: ${perfilController.selectedPerfil!['departamento']}'),
                      Text(
                          'Municipio: ${perfilController.selectedPerfil!['municipio']}'),
                      Text(
                          'Dirección: ${perfilController.selectedPerfil!['direccion']}'),
                    ],
                  ),
/////////////////////////////////////EDITAR PERFIL///////////////////////////////////////
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      context.go('/perfilvacunas/creupdperfil', extra: {
                        "perfil": perfilController.selectedPerfil!,
                        "editar": true
                      });
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
                itemCount: perfilController.selectedPerfil!['vacunas'].length,
                itemBuilder: (context, index) {
                  final vacuna =
                      perfilController.selectedPerfil!['vacunas'][index];
                  return SizedBox(
                      height: 70,
                      child: Card(
                        color: Colors.lightBlueAccent,
                        child: ListTile(
                          title: Text(
                            vacuna['nombre'],
                          ),
                          subtitle: Text(
                              'Fecha: ${vacuna['grupo'][0].values.first['fecha']}'),
                          onTap: () {},
                          trailing: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Confirmación"),
                                    content: const Text(
                                        "¿Deseas registrar la aplicación de esta vacuna?"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text("Cancelar"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text("Confirmar"),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Cierra el diálogo de confirmación

                                          if (vacuna['grupo'][0]
                                                  .values
                                                  .first['pendientes'] ==
                                              0) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      "Vacuna Completada"),
                                                  content: const Text(
                                                      "Esta vacuna ya ha sido completada."),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: const Text("OK"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            return;
                                          } else {
                                            perfilController
                                                .selectedPerfil!['vacunas']
                                                    [index]['grupo'][0]
                                                .values
                                                .first['completadas'] += 1;
                                            perfilController
                                                .selectedPerfil!['vacunas']
                                                    [index]['grupo'][0]
                                                .values
                                                .first['pendientes'] -= 1;
                                            perfilController.perfiles[
                                                    perfilController.perfiles
                                                        .indexWhere((p) =>
                                                            p['dni'] ==
                                                            perfilController
                                                                    .selectedPerfil![
                                                                'dni'])]
                                                ['vacunas'][index]['grupo'][0];
                                            perfilController
                                                .selectedPerfil = perfilController
                                                    .perfiles[
                                                perfilController.perfiles
                                                    .indexWhere((p) =>
                                                        p['dni'] ==
                                                        perfilController
                                                                .selectedPerfil![
                                                            'dni'])];
                                            //guardarPerfilesEnFirebase(perfilController.perfiles!);
                                            setState(() {});
                                          }
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
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
                  context.go('/addvacuna', extra: {
                    "perfil": perfilController.selectedPerfil!,
                    "editar": true
                  });
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
                    '/grafico',
                    extra: perfilController.selectedPerfil,
                  );
                },
              ),
            ),
            const SizedBox(height: 4.0),
          ],
        ),
      ),
    );
  }
}
