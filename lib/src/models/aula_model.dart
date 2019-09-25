import 'dart:convert';

AulaModel aulaModelFromJson(String str) => AulaModel.fromJson(json.decode(str));

String aulaModelToJson(AulaModel data) => json.encode(data.toJson());

class AulaModel {
    String id;
    String nombreAula;
    String idProfesor;
    String idHorario;
    String idUbicacion;
    String nombreMateria;
    bool disponibilidad;
    String fotoUrl;

    AulaModel({
        this.id,
        this.nombreAula = '',
        this.idProfesor = '',
        this.idHorario = '',
        this.idUbicacion = '',
        this.nombreMateria = '',
        this.disponibilidad = true,
        this.fotoUrl,
    });

    factory AulaModel.fromJson(Map<String, dynamic> json) => AulaModel(
        id              : json["id"],
        nombreAula      : json["nombre_aula"],
        idProfesor      : json["id_profesor"],
        idHorario       : json["id_horario"],
        idUbicacion     : json["id_ubicacion"],
        nombreMateria   : json["nombre_materia"],
        disponibilidad  : json["disponibilidad"],
        fotoUrl         : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        //"id"             : id,
        "nombre_aula"    : nombreAula,
        "id_profesor"    : idProfesor,
        "id_horario"     : idHorario,
        "id_ubicacion"   : idUbicacion,
        "nombre_materia" : nombreMateria,
        "disponibilidad" : disponibilidad,
        "fotoUrl"        : fotoUrl,
    };
}
