import 'dart:convert';
import 'package:latlong/latlong.dart';

 
EstablecimientoModel establecimientoModelFromJson(String str) => EstablecimientoModel.fromJson(json.decode(str));

String establecimientoModelToJson(EstablecimientoModel data) => json.encode(data.toJson());

class Establecimiento {

  List<EstablecimientoModel> items = new List();

  Establecimiento();

  Establecimiento.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final establecimiento = new EstablecimientoModel.fromJson(item);
      items.add( establecimiento );
    }

  }

}

class EstablecimientoModel {
    String id;
    String descripcion;
    String ubicacion;

    EstablecimientoModel({
        this.id,
        this.descripcion,
        this.ubicacion,
    });

    factory EstablecimientoModel.fromJson(Map<String, dynamic> json) => EstablecimientoModel(      
        id              : json["id"],
        descripcion     : json["descripcion"],
        ubicacion       : json["ubicacion"],
    ); 

    Map<String, dynamic> toJson() => {
        "id"            : id,
        "descripcion"   : descripcion,
        "ubicacion"     : ubicacion,
    };

    //retornar la latitud y longitud desde el mapa como un objeto latlng
    getLatLng(){
    // geo:-28.459132242544204,-65.784165276512
    //con substring ignora los primeros 4 digitos geo:
    //con split va a convertir en lista donde encuentre la ,
      final lalo = ubicacion.substring(4).split(',');
      final lat = double.parse(lalo[0]);
      final lng = double.parse(lalo[1]);
      return LatLng(lat,lng);
    }
}
