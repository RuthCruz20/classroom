
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:classroom/src/models/clase_model.dart';


class ClasesProvider {

  final String _url = 'https://classroom-info.firebaseio.com';


  Future<bool> crearClase( ClaseModel clase ) async {
    
    final url = '$_url/clases.json';

    final resp = await http.post( url, body: claseModelToJson(clase) );

    final decodedData = json.decode(resp.body);

    print( decodedData );

    return true;

  }

  Future<bool> editarClase( ClaseModel clase ) async {
    
    final url = '$_url/clases/${ clase.id }.json';

    final resp = await http.put( url, body: claseModelToJson(clase) );

    final decodedData = json.decode(resp.body);

    print( decodedData );

    return true;

  }



  Future<List<ClaseModel>> cargarClases() async {

    final url  = '$_url/clases.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ClaseModel> clases = new List();


    if ( decodedData == null ) return [];

    decodedData.forEach( ( id, aul ){

      final claseTemp = ClaseModel.fromJson(aul);
      claseTemp.id = id;

      clases.add( claseTemp );

    });

    // print( aulas[0].id );

    return clases;

  }


  Future<int> borrarAula( String id ) async { 

    final url  = '$_url/clases/$id.json';
    final resp = await http.delete(url);

    print( resp.body );

    return 1;
  }


}

