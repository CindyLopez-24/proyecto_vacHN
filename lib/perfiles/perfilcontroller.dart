import 'package:get/get.dart';
import 'package:app_vacunas/perfiles/vacunas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PerfilController extends GetxController {
  List<Map<String, dynamic>> perfiles = [];
  String? selectedValue;
  Map<String, dynamic>? selectedPerfil;
  String? uid;

  Future<void> eliminarPerfil(String id) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference perfilesRef = firestore.collection(uid!);

    await perfilesRef.doc(id).delete();
  }

  Future<void> guardarPerfilesEnFirebase(
      List<Map<String, dynamic>> perfiles) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference perfilesRef = firestore.collection(uid!);

    for (final perfil in perfiles) {
      final String id = perfil['dni'] ?? firestore.collection(uid!).doc().id;

      await perfilesRef.doc(id).set(perfil);
    }
  }

  Future<List<Map<String, dynamic>>> obtenerPerfilesDesdeFirestore() async {
    final snapshot = await FirebaseFirestore.instance.collection(uid!).get();

    return snapshot.docs.map((doc) {
      final data = doc.data();

      return {
        'tipo': data['tipo'] ?? '',
        'nombre': data['nombre'] ?? '',
        'fecha de nacimiento': data['fecha de nacimiento'] ?? '',
        'dni': data['dni'] ?? '',
        'sexo': data['sexo'] ?? '',
        'departamento': data['departamento'] ?? '',
        'municipio': data['municipio'] ?? '',
        'direccion': data['direccion'] ?? '',
        'vacunas': (data['vacunas'] as List<dynamic>).map((vacunaData) {
          return Vacuna(
            nombre: vacunaData['nombre'],
            grupo: (vacunaData['grupo'] as List<dynamic>).map((grupoItem) {
              final grupoMap = Map<String, dynamic>.from(grupoItem);
              return grupoMap.map((clave, valor) => MapEntry(
                    clave,
                    Map<String, dynamic>.from(valor),
                  ));
            }).toList(),
          ).toMap();
        }).toList(),
      };
    }).toList();
  }
}
