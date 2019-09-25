import 'dart:convert';

UbicacionModel ubicacionModelFromJson(String str) => UbicacionModel.fromJson(json.decode(str));

String ubicacionModelToJson(UbicacionModel data) => json.encode(data.toJson());

class UbicacionModel {
    String id;
    String dia;
    String horaInicio;
    String horaFin;
    String fotoUrl;

    UbicacionModel({
        this.id,
        this.dia,
        this.horaInicio,
        this.horaFin,
        this.fotoUrl,
    });

    factory UbicacionModel.fromJson(Map<String, dynamic> json) => UbicacionModel(
        id            : json["id"],
        dia           : json["dia"],
        horaInicio    : json["hora_inicio"],
        horaFin       : json["hora_fin"],
        fotoUrl       : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id"            : id,
        "dia"           : dia,
        "hora_inicio"   : horaInicio,
        "hora_fin"      : horaFin,
        "fotoUrl"       : fotoUrl,
    };
}
