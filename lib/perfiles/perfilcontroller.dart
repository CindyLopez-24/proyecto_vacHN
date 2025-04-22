import 'package:get/get.dart';
import 'package:app_vacunas/perfiles/vacunas.dart';

class PerfilController extends GetxController {
  List<Map<String, dynamic>> perfiles = [
    {
      'tipo': 'menor de 5 años',
      'nombre': 'Juan Pérez',
      'fecha de nacimiento': DateTime(1990, 1, 1),
      'dni': '12345678',
      'sexo': 'Masculino',
      'departamento': 'Yoro',
      'municipio': 'Morazán',
      'direccion': 'Av. Ejemplo 123',
      'vacunas': [
        Vacuna(
          nombre: 'Tétano',
          grupo: [
            {
              'Adulto': {
                'dosis': 5,
                'completadas': 2,
                'pendientes': 3,
                'fecha': DateTime(2005, 5, 15),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Difteria',
          grupo: [
            {
              'Adulto': {
                'dosis': 4,
                'completadas': 1,
                'pendientes': 3,
                'fecha': DateTime(1945, 5, 15),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Influenza',
          grupo: [
            {
              'Adulto': {
                'dosis': 7,
                'completadas': 5,
                'pendientes': 2,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Hepatitis B',
          grupo: [
            {
              'Paciente en diálisis': {
                'dosis': 4,
                'completadas': 2,
                'pendientes': 2,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Varicela',
          grupo: [
            {
              'Niño de 1-5 años': {
                'dosis': 1,
                'completadas': 0,
                'pendientes': 1,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Fiebre Amarilla',
          grupo: [
            {
              'Niño de 1-5 años': {
                'dosis': 1,
                'completadas': 0,
                'pendientes': 1,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
      ],
    },
    {
      'tipo': 'mayor de 5 años',
      'nombre': 'María López',
      'fecha de nacimiento': DateTime(1985, 5, 15),
      'dni': '87654321',
      'sexo': 'Femenino',
      'departamento': 'Cortés',
      'municipio': 'San Pedro Sula',
      'direccion': 'Calle Ejemplo 456',
      'vacunas': [
        Vacuna(
          nombre: 'Hepatitis B',
          grupo: [
            {
              'Paciente en dialisis': {
                'dosis': 4,
                'completadas': 1,
                'pendientes': 3,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Tétano',
          grupo: [
            {
              'Adulto': {
                'dosis': 5,
                'completadas': 2,
                'pendientes': 3,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Difteria',
          grupo: [
            {
              'Adulto': {
                'dosis': 3,
                'completadas': 2,
                'pendientes': 1,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Influenza',
          grupo: [
            {
              'Adulto': {
                'dosis': 7,
                'completadas': 4,
                'pendientes': 3,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
      ],
    },
    {
      'tipo': 'menor de 5 años',
      'nombre': 'Carlos García',
      'fecha de nacimiento': DateTime(2000, 8, 20),
      'dni': '13579246',
      'sexo': 'Masculino',
      'departamento': 'Lempira',
      'municipio': 'Gracias',
      'direccion': 'Av. Ejemplo 789',
      'vacunas': [
        Vacuna(
          nombre: 'Sarampión',
          grupo: [
            {
              'Niño de 1-5 años': {
                'dosis': 2,
                'completadas': 1,
                'pendientes': 1,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Rubéola',
          grupo: [
            {
              'Niño de 1-5 años': {
                'dosis': 2,
                'completadas': 0,
                'pendientes': 2,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Varicela',
          grupo: [
            {
              'Niño de 1-5 años': {
                'dosis': 1,
                'completadas': 0,
                'pendientes': 1,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Neumococo',
          grupo: [
            {
              'Niño de 1-5 años': {
                'dosis': 2,
                'completadas': 1,
                'pendientes': 1,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Meningococo',
          grupo: [
            {
              'Niño de 1-5 años': {
                'dosis': 2,
                'completadas': 2,
                'pendientes': 0,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
      ],
    },
    {
      'tipo': 'menor de 5 años',
      'nombre': 'Ana Torres',
      'fecha de nacimiento': DateTime(2015, 3, 10),
      'dni': '24681357',
      'sexo': 'Femenino',
      'departamento': 'Colón',
      'municipio': 'Tocoa',
      'direccion': 'Calle Ejemplo 321',
      'vacunas': [
        Vacuna(
          nombre: 'Neumococo',
          grupo: [
            {
              'Niño de 1-5 años': {
                'dosis': 2,
                'completadas': 0,
                'pendientes': 2,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Rotavirus',
          grupo: [
            {
              'Niño de 1-5 años': {
                'dosis': 2,
                'completadas': 0,
                'pendientes': 2,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'SRP',
          grupo: [
            {
              'Niño de 1-5 años': {
                'dosis': 2,
                'completadas': 1,
                'pendientes': 1,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Hepatitis A pediátrica',
          grupo: [
            {
              'Niño de 1-5 años': {
                'dosis': 1,
                'completadas': 1,
                'pendientes': 0,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
        Vacuna(
          nombre: 'Varicela',
          grupo: [
            {
              'Niño de 1-5 años': {
                'dosis': 1,
                'completadas': 1,
                'pendientes': 0,
                'fecha': DateTime.now(),
              }
            }
          ],
        ).toMap(),
      ],
    },
  ];
}
