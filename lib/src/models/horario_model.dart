import 'dart:convert';

import 'package:classroom/src/models/usuario_model.dart';


HorarioModel horarioModelFromJson(String str) => HorarioModel.fromJson(json.decode(str));

String horarioModelToJson(HorarioModel data) => json.encode(data.toJson());



class HorarioModel{
  String id;
  String hora;
  String estado;
  List<UsuarioModel> responsables;

  HorarioModel({
        this.id,
        this.hora,
        this.estado,
        this.responsables,
    });

    factory HorarioModel.fromJson(Map<String, dynamic> json) {
      List<UsuarioModel> resList;
      if (json['responsables']==null){
      resList = [];
      }else{
      var rlist = json['responsables'] as List;
      resList = rlist.map((i)=>UsuarioModel.fromJson(i)).toList();
      }
      return HorarioModel(
        id            : json["id"],
        hora          : json["hora"],
        estado        : json["estado"],
        responsables  : resList,
    );
    } 

    Map<String, dynamic> toJson() => {
        //"id"          : id,
        "hora"        : hora,
        "estado"      : estado,
        "responsables": responsables,
        //"responsables": List<Usuario>.from(responsables.map((x) => x.toJson())),
    };
}