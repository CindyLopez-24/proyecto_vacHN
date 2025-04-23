import 'package:app_vacunas/perfiles/perfilcontroller.dart';
import 'package:app_vacunas/perfiles/vacunas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddVacuna extends StatefulWidget {
  const AddVacuna({super.key});

  @override
  State<AddVacuna> createState() => _AddVacunaState();
}

class _AddVacunaState extends State<AddVacuna> {
  Map<String, dynamic>? extra_;
  List<Vacuna>? vacunas;
  Map<String, dynamic>? perfil;
  PerfilController perfilcontroller = Get.find<PerfilController>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    extra_ = GoRouter.of(context).state.extra as Map<String, dynamic>?;
    extra_!['perfil']['tipo'] == 'mayor de 5 años'
        ? vacunas = vacunasMayoresde5
        : vacunas = vacunasMenoresde5;
    for (int i = 0; i < extra_!['perfil']['vacunas'].length; i++) {
      for (int j = 0; j < vacunas!.length; j++) {
        if (extra_!['perfil']['vacunas'][i]['nombre'] == vacunas![j].nombre) {
          vacunas!.removeAt(j);
        }
      }
    }
    perfil = extra_!['perfil'] as Map<String, dynamic>?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Agregar Vacuna'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: vacunas!.length,
            itemBuilder: (context, indexvacuna) {
              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: ListTile(
                    title: Text(vacunas![indexvacuna].nombre),
                    //subtitle: Text(vacunasMayoresde5[index]['fecha']),
                    trailing: IconButton(
                      color: const Color.fromARGB(255, 4, 36, 63),
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Grupos de Vacunación"),
                              content: SizedBox(
                                height: (85 *
                                        vacunas![indexvacuna].grupo.length)
                                    .toDouble(), // Altura fija para que se vea bien
                                width: double
                                    .maxFinite, // Ajusta el ancho automáticamente
                                child: ListView.builder(
                                  itemCount: vacunas![indexvacuna]
                                      .grupo
                                      .length, // Número de elementos en la lista
                                  itemBuilder: (context, indexgrupo) {
                                    return Card(
                                      color: Colors.lightBlueAccent,
                                      child: ListTile(
                                        title: Text(vacunas![indexvacuna]
                                            .grupo[indexgrupo]
                                            .keys
                                            .first),
                                        leading: const Icon(Icons.vaccines),
                                        onTap: () {
                                          confirmacionDialog(
                                              context, indexgrupo, indexvacuna);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Cerrar el diálogo
                                  },
                                  child: const Text("Cerrar"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Future<dynamic> confirmacionDialog(
      BuildContext context, int indexgrupo, int indexvacuna) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agregar vacuna'),
          content: RichText(
              text: TextSpan(
            text: '¿Está seguro de agregar la vacuna ',
            style: const TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: vacunas![indexvacuna].nombre,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const TextSpan(text: ' del grupo '),
              TextSpan(
                text: vacunas![indexvacuna].grupo[indexgrupo].keys.first,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const TextSpan(text: ' a su perfil?'),
            ],
          )),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final Vacuna nuevaVacuna = Vacuna(
                  nombre: vacunas![indexvacuna].nombre,
                  grupo: [
                    {
                      vacunas![indexvacuna].grupo[indexgrupo].keys.first: {
                        "dosis": vacunas![indexvacuna].grupo[indexgrupo][
                            vacunas![indexvacuna]
                                .grupo[indexgrupo]
                                .keys
                                .first]?['dosis'],
                        "completadas": 0,
                        "pendientes": vacunas![indexvacuna].grupo[indexgrupo][
                            vacunas![indexvacuna]
                                .grupo[indexgrupo]
                                .keys
                                .first]?['dosis'],
                        "fecha": DateFormat('dd-MM-yyyy').format(
                          DateTime.now(),
                        ),
                      }
                    }
                  ],
                );
                /////////////////////////////////////////7777
                final nuevoPerfil = perfil as Map<String, dynamic>;

                final index = perfilcontroller.perfiles
                    .indexWhere((p) => p['dni'] == nuevoPerfil['dni']);
                if (index != -1) {
                  perfilcontroller.perfiles[index] = nuevoPerfil;
                }
                //print(perfilController.perfiles![index]['vacunas']);

                perfilcontroller.perfiles[index]['vacunas']
                    .add(nuevaVacuna.toMap());
                //perfilController.perfiles[index]['vacunas'][0] = extra!['nuevavacuna'];

                ////////////////////////////////////////////
                //perfilcontroller.perfiles![0]['vacunas']
                //    .add(nuevaVacuna.toMap());
                perfilcontroller
                    .guardarPerfilesEnFirebase(perfilcontroller.perfiles);
                context.pushReplacement('/perfilvacunas', extra: {
                  "perfil": perfil,
                  "editar": extra_!["editar"],
                  "nuevavacuna": nuevaVacuna,
                });
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}
