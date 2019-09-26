import 'dart:io';

import 'package:flutter/material.dart';


import 'package:classroom/src/models/establecimiento_model.dart';
import 'package:classroom/src/providers/establecimientos_provider.dart';


class EstablecimientoPage extends StatefulWidget {

  @override
  _EstablecimientoPageState createState() => _EstablecimientoPageState();
}

class _EstablecimientoPageState extends State<EstablecimientoPage> {
  
  final formKey     = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final aulaProvider = new EstablecimientosProvider();

  EstablecimientoModel establecimiento = new EstablecimientoModel();
  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {

    final EstablecimientoModel establecimientoData = ModalRoute.of(context).settings.arguments;
    if ( establecimientoData != null ) {
      establecimiento = establecimientoData;
    }
    
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Establecimiento'),
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.photo_size_select_actual ),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon( Icons.camera_alt ),
            onPressed:(){},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearDescripcion(),
                //_crearLocalizacion(),
                _crearBotonGuardar()
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget _crearDescripcion() {

    return TextFormField(
      initialValue: establecimiento.descripcion,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Establecimiento'
      ),
      onSaved: (value) => establecimiento.descripcion = value,
      validator: (value) {
        if ( value.length < 3 ) {
          return 'Ingrese una descripción del Establecimiento';
        } else {
          return null;
        }
      },
    );

  }



  Widget _crearBotonGuardar() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon( Icons.save ),
      onPressed: ( _guardando ) ? null : _submit,
    );
  }

  void _submit() async {

    if ( !formKey.currentState.validate() ) return;

    formKey.currentState.save();

    setState(() {_guardando = true; });

   

    if ( establecimiento.id == null ) {
      aulaProvider.crearEstablecimiento(establecimiento);
    } else {
      aulaProvider.editarEstablecimiento(establecimiento);
    }
    // setState(() {_guardando = false; });
    mostrarSnackbar('Registro guardado');

    Navigator.pop(context);

  }


  void mostrarSnackbar(String mensaje) {

    final snackbar = SnackBar(
      content: Text( mensaje ),
      duration: Duration( milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);

  }


  

}



