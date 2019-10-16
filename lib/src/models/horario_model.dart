import 'dart:convert';

import 'package:classroom/src/models/clase_model.dart';


HorarioModel horarioModelFromJson(String str) => HorarioModel.fromJson(json.decode(str));

String horarioModelToJson(HorarioModel data) => json.encode(data.toJson());



class HorarioModel{
  String id;
  String hora;
  String estado;
  ClaseModel clase;

  HorarioModel({
        this.id,
        this.hora,
        this.estado,
        this.clase,
    });

    factory HorarioModel.fromJson(Map<String, dynamic> json) => HorarioModel(
        id            : json["id"],
        hora          : json["hora"],
        estado        : json["estado"],
        clase         : ClaseModel.fromJson(json['clase']),
    );

    Map<String, dynamic> toJson() => {
        //"id"          : id,
        "hora"        : hora,
        "estado"      : estado,
        "clase"       : clase,
    };
}