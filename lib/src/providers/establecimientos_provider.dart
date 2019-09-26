
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:classroom/src/models/establecimiento_model.dart';

class EstablecimientosProvider {

  final String _url = 'https://classroom-info.firebaseio.com';


  Future<bool> crearEstablecimiento( EstablecimientoModel establecimiento ) async {
    
    
    final url = '$_url/establecimientos.json';
    

    final resp = await http.post( url, body: establecimientoModelToJson(establecimiento) );

    final decodedData = json.decode(resp.body);

    print( decodedData );

    return true;

  }

  Future<bool> editarEstablecimiento( EstablecimientoModel establecimiento) async {
    
    final url = '$_url/establecimientos/${ establecimiento.id }.json';

    final resp = await http.put( url, body: establecimientoModelToJson(establecimiento) );

    final decodedData = json.decode(resp.body);

    print( decodedData );

    return true;

  }



  Future<List<EstablecimientoModel>> cargarEstablecimientos() async {

    final url  = '$_url/establecimientos.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<EstablecimientoModel> establecimientos= new List();


    if ( decodedData == null ) return [];

    decodedData.forEach( ( id, est ){

      final establecimientoTemp = EstablecimientoModel.fromJson(est);
      establecimientoTemp.id = id;

      establecimientos.add( establecimientoTemp );

    });

    // print( aulas[0].id );

    return establecimientos;

  }


  Future<int> borrarEstablecimiento( String id ) async { 

    final url  = '$_url/establecimientos/$id.json';
    final resp = await http.delete(url);

    print( resp.body );

    return 1;
  }


  

}

