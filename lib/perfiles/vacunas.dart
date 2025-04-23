class Vacuna {
  final String nombre;
  final List<Map<String, Map<String, dynamic>>> grupo;

  Vacuna({
    required this.nombre,
    required this.grupo,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'grupo': grupo,
    };
  }
}

List<Vacuna> vacunasMayoresde5 = [
  Vacuna(
    nombre: "Hepatitis B",
    grupo: [
      {
        "Paciente en dialisis": {
          "dosis": 4,
          "completadas": 0,
          "pendientes": 4,
          "fecha": DateTime.now(),
        }
      },
      {
        "Victima de agresión sexual": {
          "dosis": 4,
          "completadas": 0,
          "pendientes": 4,
          "fecha": DateTime.now(),
        }
      },
      {
        "Grupo de riesgo": {
          "dosis": 3,
          "completadas": 0,
          "pendientes": 3,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "Td",
    grupo: [
      {
        "Escolares": {
          "dosis": 1,
          "completadas": 0,
          "pendientes": 1,
          "fecha": DateTime.now(),
        }
      },
      {
        "Embarazada con historial desconocido o inadecuado": {
          "dosis": 5,
          "completadas": 0,
          "pendientes": 5,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "Papiloma Humano",
    grupo: [
      {
        "Niña de 11-15 años sanas": {
          "dosis": 1,
          "completadas": 0,
          "pendientes": 1,
          "fecha": DateTime.now(),
        }
      },
      {
        "Niña de 11-15 años inmunodeprimidas o infectadas por VIH": {
          "dosis": 3,
          "completadas": 0,
          "pendientes": 3,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "Hepatitis A adultos",
    grupo: [
      {
        "En general": {
          "dosis": 2,
          "completadas": 0,
          "pendientes": 2,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "Vacuna Tdap",
    grupo: [
      {
        "Embarazada de 26-37 semanas de gestación": {
          "dosis": 1,
          "completadas": 0,
          "pendientes": 1,
          "fecha": DateTime.now(),
        }
      },
      {
        "Trabajador de salud": {
          "dosis": 1,
          "completadas": 0,
          "pendientes": 1,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "Vacuna DT pediátrica",
    grupo: [
      {
        "En general": {
          "dosis": 5,
          "completadas": 0,
          "pendientes": 5,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "Fiebre Amarilla",
    grupo: [
      {
        "Población desde 1 año de edad hasta 59 años": {
          "dosis": 1,
          "completadas": 0,
          "pendientes": 1,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "Influenza Estacional",
    grupo: [
      {
        "Niños de 6 a 23 meses no vacunados": {
          "dosis": 2,
          "completadas": 0,
          "pendientes": 2,
          "fecha": DateTime.now(),
        }
      },
      {
        "Grupos de riesgo": {
          "dosis": 1,
          "completadas": 0,
          "pendientes": 1,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "SRP Jeryl Lynn",
    grupo: [
      {
        "Grupos de riesgo mayores de 5 años de edad": {
          "dosis": 1,
          "completadas": 0,
          "pendientes": 1,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
];

List<Vacuna> vacunasMenoresde5 = [
  Vacuna(
    nombre: "BCG",
    grupo: [
      {
        "Menor de 5 años": {
          "dosis": 1,
          "completadas": 0,
          "pendientes": 1,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "Hepatitis B pediátrica",
    grupo: [
      {
        "Menor de 5 años": {
          "dosis": 1,
          "completadas": 0,
          "pendientes": 1,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "DPT-HepB-Hib",
    grupo: [
      {
        "Menor de 5 años": {
          "dosis": 3,
          "completadas": 0,
          "pendientes": 3,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "Polivirus Inactivados",
    grupo: [
      {
        "Menor de 5 años": {
          "dosis": 2,
          "completadas": 0,
          "pendientes": 2,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "Oral Poliovirus Bivalente",
    grupo: [
      {
        "Menor de 5 años": {
          "dosis": 4,
          "completadas": 0,
          "pendientes": 4,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "Neumococo conjugada 13-Valente",
    grupo: [
      {
        "Menor de 5 años": {
          "dosis": 3,
          "completadas": 0,
          "pendientes": 3,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "Rotavirus",
    grupo: [
      {
        "Menor de 5 años": {
          "dosis": 2,
          "completadas": 0,
          "pendientes": 2,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "SRP",
    grupo: [
      {
        "Menor de 5 años": {
          "dosis": 2,
          "completadas": 0,
          "pendientes": 2,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "Hepatitis A pediátrica",
    grupo: [
      {
        "Menor de 5 años": {
          "dosis": 1,
          "completadas": 0,
          "pendientes": 1,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "Vacuna de Varicela",
    grupo: [
      {
        "Menor de 5 años": {
          "dosis": 1,
          "completadas": 0,
          "pendientes": 1,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
  Vacuna(
    nombre: "DPT",
    grupo: [
      {
        "Menor de 5 años": {
          "dosis": 2,
          "completadas": 0,
          "pendientes": 2,
          "fecha": DateTime.now(),
        }
      },
    ],
  ),
];
