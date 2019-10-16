import 'dart:convert';

import 'package:classroom/src/models/usuario_model.dart';

ClaseModel claseModelFromJson(String str) => ClaseModel.fromJson(json.decode(str));

String claseModelToJson(ClaseModel data) => json.encode(data.toJson());

class ClaseModel {
    String id;
    String nombre;
    List<dynamic> profesores;

    ClaseModel({
        this.id,
        this.nombre,
        this.profesores,
    });

    factory ClaseModel.fromJson(Map<String, dynamic> json){
      List<dynamic> resList;
      if (json['profesores']==null){   
      resList = [];
      }else{
      var rlist = json['profesores'] as List;
      resList = rlist.map((i)=>UsuarioModel.fromJson(i)).toList();
      }
      return ClaseModel(
        id          : json["id"],
        nombre      : json["nombre"],
        profesores  : resList,
    );
    } 

    Map<String, dynamic> toJson() => {
        "id"        : id,
        "nombre"    : nombre,
        "profesores": profesores,
    };
}
