import 'dart:convert';

ProfesorModel profesorModelFromJson(String str) => ProfesorModel.fromJson(json.decode(str));

String profesorModelToJson(ProfesorModel data) => json.encode(data.toJson());

class ProfesorModel {
    String id;
    String nombre;
    String apellido;
    String email;
    String telefono;
    String fotoUrl;

    ProfesorModel({
        this.id,
        this.nombre ='',
        this.apellido ='',
        this.email ='',
        this.telefono ='',
        this.fotoUrl,
    });

    factory ProfesorModel.fromJson(Map<String, dynamic> json) => ProfesorModel(
        id        : json["id"],
        nombre    : json["nombre"],
        apellido  : json["apellido"],
        email     : json["email"],
        telefono  : json["telefono"],
        fotoUrl   : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id"        : id,
        "nombre"    : nombre,
        "apellido"  : apellido,
        "email"     : email,
        "telefono"  : telefono,
        "fotoUrl"   : fotoUrl,
    };
}
