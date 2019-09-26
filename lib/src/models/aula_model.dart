import 'dart:convert';

import 'package:classroom/src/models/establecimiento_model.dart';
import 'package:classroom/src/models/horario_model.dart';


AulaModel aulaModelFromJson(String str) => AulaModel.fromJson(json.decode(str));

String aulaModelToJson(AulaModel data) => json.encode(data.toJson());

class AulaModel {
    String id;
    String nombre;
    String fotoUrl;
    EstablecimientoModel establecimiento;
    List<HorarioModel> lunes;
    List<HorarioModel> martes;
    List<HorarioModel> miercoles;
    List<HorarioModel> jueves;
    List<HorarioModel> viernes;

    AulaModel({
        this.id,
        this.nombre,
        this.fotoUrl,
        this.establecimiento,
        this.lunes,
        this.martes,
        this.miercoles,
        this.jueves,
        this.viernes,
    });

    factory AulaModel.fromJson(Map<String, dynamic> json) {
      var llist = json['lunes'] as List;
      List<HorarioModel> lunesList = llist.map((i)=>HorarioModel.fromJson(i)).toList();
      var mlist = json['martes'] as List;
      List<HorarioModel> martesList = mlist.map((i)=>HorarioModel.fromJson(i)).toList();
      var milist = json['miercoles'] as List;
      List<HorarioModel> miercolesList = milist.map((i)=>HorarioModel.fromJson(i)).toList();
      var jlist = json['jueves'] as List;
      List<HorarioModel> juevesList = jlist.map((i)=>HorarioModel.fromJson(i)).toList();
      var vlist = json['viernes'] as List;
      List<HorarioModel> viernesList = vlist.map((i)=>HorarioModel.fromJson(i)).toList();
      return AulaModel(
        id              : json["id"],
        nombre          : json["nombre"],
        fotoUrl         : json["foto_url"],
        establecimiento : EstablecimientoModel.fromJson(json['establecimiento']),
        lunes           : lunesList,
        martes          : martesList,
        miercoles       : miercolesList,
        jueves          : juevesList,
        viernes         : viernesList,
    );
    } 

    Map<String, dynamic> toJson() => {
        //"id"        : id,
        "nombre"          : nombre,
        "foto_url"        : fotoUrl,
        "establecimiento" : establecimiento,
        "lunes"           : lunes,
        "martes"          : martes,
        "miercoles"       : miercoles,
        "jueves"          : jueves,
        "viernes"         : viernes,
        /*"lunes"     : List<dynamic>.from(lunes.map((x) => x.toJson())),
        "martes"    : List<dynamic>.from(martes.map((x) => x.toJson())),
        "miercoles" : List<dynamic>.from(miercoles.map((x) => x.toJson())),
        "jueves"    : List<dynamic>.from(jueves.map((x) => x.toJson())),
        "viernes"   : List<dynamic>.from(viernes.map((x) => x.toJson())),*/
    };

   crearCalendario(){
    final horas = new List<HorarioModel>();
    for(int i=8; i<23;i++){
      final hora = new HorarioModel(hora: "$i:00",estado: "Libre",responsables: []);
      horas.add(hora);
    }
    this.lunes     = horas;
    this.martes    = horas;
    this.miercoles = horas;
    this.jueves    = horas;
    this.viernes   = horas;
  }
}
