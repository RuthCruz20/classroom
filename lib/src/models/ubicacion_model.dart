import 'dart:convert';

UbicacionModel ubicacionModelFromJson(String str) => UbicacionModel.fromJson(json.decode(str));

String ubicacionModelToJson(UbicacionModel data) => json.encode(data.toJson());

class UbicacionModel {
    String id;
    String establecimiento;
    String descripcion;
    String fotoUrl;

    UbicacionModel({
        this.id,
        this.establecimiento = '',
        this.descripcion = '',
        this.fotoUrl,
    });

    factory UbicacionModel.fromJson(Map<String, dynamic> json) => UbicacionModel(
        id               : json["id"],
        establecimiento  : json["establecimiento"],
        descripcion      : json["descripcion"],
        fotoUrl          : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id"                : id,
        "establecimiento"   : establecimiento,
        "descripcion"       : descripcion,
        "fotoUrl"           : fotoUrl,
    };
}
