
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:mime_type/mime_type.dart';

import 'package:classroom/src/models/aula_model.dart';

class AulasProvider {

  final String _url = 'https://classroom-info.firebaseio.com';


  Future<bool> crearAula( AulaModel aula ) async {
    aula.crearCalendario();
    
    final url = '$_url/aulas.json';
    

    final resp = await http.post( url, body: aulaModelToJson(aula) );

    final decodedData = json.decode(resp.body);

    print( decodedData );

    return true;

  }

  Future<bool> editarAula( AulaModel aula ) async {
    
    final url = '$_url/aulas/${ aula.id }.json';

    final resp = await http.put( url, body: aulaModelToJson(aula) );

    final decodedData = json.decode(resp.body);

    print( decodedData );

    return true;

  }



  Future<List<AulaModel>> cargarAulas() async {

    final url  = '$_url/aulas.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<AulaModel> aulas = new List();


    if ( decodedData == null ) return [];

    decodedData.forEach( ( id, aul ){

      final aulaTemp = AulaModel.fromJson(aul);
      aulaTemp.id = id;

      aulas.add( aulaTemp );

    });

    // print( aulas[0].id );

    return aulas;

  }


  Future<int> borrarAula( String id ) async { 

    final url  = '$_url/aulas/$id.json';
    final resp = await http.delete(url);

    print( resp.body );

    return 1;
  }


  Future<String> subirImagen( File imagen ) async {

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dwmi8xbed/image/upload?upload_preset=zlvrl28a');
    final mimeType = mime(imagen.path).split('/'); //image/jpeg

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath(
      'file', 
      imagen.path,
      contentType: MediaType( mimeType[0], mimeType[1] )
    );

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if ( resp.statusCode != 200 && resp.statusCode != 201 ) {
      print('Algo salio mal');
      print( resp.body );
      return null;
    }

    final respData = json.decode(resp.body);
    print( respData);

    return respData['secure_url'];


  }
  /*List<AulaModel> buscarAula (String query){
    

  }*/

}

