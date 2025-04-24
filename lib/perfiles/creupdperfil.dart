import 'package:app_vacunas/perfiles/departamentos_ymunicipios.dart';
import 'package:app_vacunas/perfiles/perfilcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

const List<String> sexos = ["Masculino", "Femenino"];

class CreUpdPerfil extends StatefulWidget {
  const CreUpdPerfil({super.key});

  @override
  State<CreUpdPerfil> createState() => _CreUpdPerfilState();
}

class _CreUpdPerfilState extends State<CreUpdPerfil> {
  Map<String, dynamic>? perfil;
  Map<String, dynamic>? extra_;
  PerfilController perfilcontroller = Get.find<PerfilController>();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController fechanacimientoController =
      TextEditingController();
  final TextEditingController dniController = TextEditingController();
  final TextEditingController sexoController = TextEditingController();
  final TextEditingController departamentoController = TextEditingController();
  final TextEditingController municipioController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();

  String? selectedSexo;
  String? selectedDepartamento;
  String? selectedMunicipio;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (extra_ == null) {
      extra_ = GoRouter.of(context).state.extra as Map<String, dynamic>?;
      if (extra_ != null && extra_!["editar"] == true) {
        perfil = extra_!['perfil'];
        nombreController.text = perfil!['nombre'];
        fechanacimientoController.text = perfil!['fecha de nacimiento'];
        dniController.text = perfil!['dni'];
        sexoController.text = perfil!['sexo'];
        departamentoController.text = perfil!['departamento'];
        municipioController.text = perfil!['municipio'];
        direccionController.text = perfil!['direccion'];

        selectedSexo = sexoController.text;
        selectedDepartamento = departamentoController.text;
        selectedMunicipio = municipioController.text;
      } else {
        fechanacimientoController.text = "00-00-0000";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text(extra_ != null && extra_!["editar"] == true
            ? 'Editar Perfil'
            : 'Crear Perfil de ${extra_!["tipo"]}'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                campoTexto('Nombre', nombreController,
                    validator: (v) => v!.isEmpty ? 'Campo obligatorio' : null),
                campoFecha(),
                campoTexto('DNI', dniController,
                    teclado: TextInputType.number,
                    validator: (v) =>
                        v!.length < 8 ? 'Debe tener al menos 8 dígitos' : null),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedSexo,
                    decoration: const InputDecoration(labelText: 'Sexo'),
                    items: sexos.map((sexo) {
                      return DropdownMenuItem<String>(
                        value: sexo,
                        child: Text(sexo),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSexo = value;
                        sexoController.text = value!;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Seleccione un sexo' : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedDepartamento,
                    decoration:
                        const InputDecoration(labelText: 'Departamento'),
                    items: departamentosYmunicipios.keys.map((dep) {
                      return DropdownMenuItem<String>(
                        value: dep,
                        child: Text(dep),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDepartamento = value;
                        departamentoController.text = value!;
                        selectedMunicipio = null;
                        municipioController.clear();
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Seleccione un departamento' : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedMunicipio,
                    decoration: const InputDecoration(labelText: 'Municipio'),
                    items: (selectedDepartamento != null
                            ? departamentosYmunicipios[selectedDepartamento]!
                            : <String>[])
                        .map((mun) {
                      return DropdownMenuItem<String>(
                        value: mun,
                        child: Text(mun),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedMunicipio = value;
                        municipioController.text = value!;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Seleccione un municipio' : null,
                  ),
                ),
                campoTexto('Dirección', direccionController,
                    validator: (v) => v!.isEmpty ? 'Campo obligatorio' : null),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  const Color.fromARGB(255, 83, 178, 247))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (extra_!["editar"]) {
                                perfil!['nombre'] = nombreController.text;
                                perfil!['fecha de nacimiento'] =
                                    fechanacimientoController.text;
                                perfil!['dni'] = dniController.text;
                                perfil!['sexo'] = sexoController.text;
                                perfil!['departamento'] =
                                    departamentoController.text;
                                perfil!['municipio'] = municipioController.text;
                                perfil!['direccion'] = direccionController.text;
                                ////////////////////////////////////////////////////////
                                final nuevoPerfil =
                                    perfil as Map<String, dynamic>;

                                final index = perfilcontroller.perfiles
                                    .indexWhere(
                                        (p) => p['dni'] == nuevoPerfil['dni']);
                                if (index != -1) {
                                  perfilcontroller.perfiles[index] =
                                      nuevoPerfil;
                                }
                                ////////////////////////////////////////////////////////
                              } else {
                                perfil = {
                                  'tipo': extra_!["tipo"] == 'Adulto'
                                      ? 'mayor de 5 años'
                                      : 'menor de 5 años',
                                  'nombre': nombreController.text,
                                  'fecha de nacimiento':
                                      fechanacimientoController.text,
                                  'dni': dniController.text,
                                  'sexo': sexoController.text,
                                  'departamento': departamentoController.text,
                                  'municipio': municipioController.text,
                                  'direccion': direccionController.text,
                                  'vacunas': [],
                                };
                                ///////////////////////////////////////////////////////
                                perfilcontroller.perfiles
                                    .add(perfil as Map<String, dynamic>);
                                ///////////////////////////////////////////////////////
                              }
                              perfilcontroller.guardarPerfilesEnFirebase(
                                  perfilcontroller.perfiles);
                              context.pushReplacement('/perfilvacunas', extra: {
                                "perfil": perfil,
                                "editar": extra_!["editar"],
                              });
                            }
                          },
                          child: const Text('Guardar'),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  const Color.fromARGB(255, 83, 178, 247))),
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text('Cancelar'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget campoTexto(String label, TextEditingController controller,
      {TextInputType teclado = TextInputType.text,
      String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: teclado,
        decoration: InputDecoration(labelText: label),
        validator: validator,
      ),
    );
  }

  Widget campoFecha() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: fechanacimientoController,
        readOnly: true,
        decoration: const InputDecoration(labelText: 'Fecha de Nacimiento'),
        onTap: () async {
          DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.tryParse("2000-01-01") ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (picked != null) {
            fechanacimientoController.text =
                DateFormat('dd-MM-yyyy').format(picked);
          }
        },
        validator: (v) {
          try {
            DateFormat('dd-MM-yyyy').parseStrict(v!);
            return null;
          } catch (_) {
            return 'Formato inválido (dd-MM-yyyy)';
          }
        },
      ),
    );
  }
}
