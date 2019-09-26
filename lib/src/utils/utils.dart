import 'package:classroom/src/models/establecimiento_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

bool isNumeric( String s ) {

  if ( s.isEmpty ) return false;

  final n = num.tryParse(s);

  return ( n == null ) ? false : true;

}


void mostrarAlerta(BuildContext context, String mensaje ) {

  showDialog(
    context: context,
    builder: ( context ) {
      return AlertDialog(
        title: Text('Información incorrecta'),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: ()=> Navigator.of(context).pop(),
          )
        ],
      );
    }
  );


}

abrirScan(BuildContext context, EstablecimientoModel scan) async {
  /*if(scan.tipo == 'http'){
    if (await canLaunch(scan.valor)) {
      await launch(scan.valor);
    } else {
      throw 'Could not launch ${scan.valor}';
    }
  }else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }*/
  Navigator.pushNamed(context, 'mapa_establecimiento', arguments: scan);
}