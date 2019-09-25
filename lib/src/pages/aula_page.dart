import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import 'package:classroom/src/models/aula_model.dart';
import 'package:classroom/src/providers/aulas_provider.dart';
import 'package:classroom/src/utils/utils.dart' as utils;


class AulaPage extends StatefulWidget {

  @override
  _AulaPageState createState() => _AulaPageState();
}

class _AulaPageState extends State<AulaPage> {
  
  final formKey     = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final aulaProvider = new AulasProvider();

  AulaModel aula = new AulaModel();
  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {

    final AulaModel aulaData = ModalRoute.of(context).settings.arguments;
    if ( aulaData != null ) {
      aula = aulaData;
    }
    
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Aula'),
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.photo_size_select_actual ),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon( Icons.camera_alt ),
            onPressed: _tomarFoto,
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
                _mostrarFoto(),
                _crearNombre(),
                _crearNombreMateria(),
                //_crearPrecio(),
                _crearDisponible(),
                _crearBoton()
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget _crearNombre() {

    return TextFormField(
      initialValue: aula.nombreAula,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Aula'
      ),
      onSaved: (value) => aula.nombreAula = value,
      validator: (value) {
        if ( value.length < 3 ) {
          return 'Ingrese el nombre del Aula';
        } else {
          return null;
        }
      },
    );

  }
  Widget _crearNombreMateria() {

    return TextFormField(
      initialValue: aula.nombreMateria,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Materia'
      ),
      onSaved: (value) => aula.nombreMateria = value,
      validator: (value) {
        if ( value.length < 3 ) {
          return 'Ingrese el nombre de la Materia';
        } else {
          return null;
        }
      },
    );

  }

/*
  Widget _crearPrecio() {
    return TextFormField(
      initialValue: aula.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      onSaved: (value) => aula.valor = double.parse(value),
      validator: (value) {

        if ( utils.isNumeric(value)  ) {
          return null;
        } else {
          return 'Sólo números';
        }

      },
    );
  }*/

  Widget _crearDisponible() {

    return SwitchListTile(
      value: aula.disponibilidad,
      title: Text('Disponiblilidad'),
      activeColor: Colors.deepPurple,
      onChanged: (value)=> setState((){
        aula.disponibilidad = value;
      }),
    );

  }



  Widget _crearBoton() {
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

    if ( foto != null ) {
      aula.fotoUrl = await aulaProvider.subirImagen(foto);
    }

    if ( aula.id == null ) {
      aulaProvider.crearAula(aula);
    } else {
      aulaProvider.editarAula(aula);
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


  Widget _mostrarFoto() {

    if ( aula.fotoUrl != null ) {
      
      return FadeInImage(
        image: NetworkImage( aula.fotoUrl ),
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );

    } else {

      return Image(

        image: AssetImage( foto?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,

      );

    }

  }


  _seleccionarFoto() async {

    _procesarImagen( ImageSource.gallery );

  }
  
  
  _tomarFoto() async {

    _procesarImagen( ImageSource.camera );

  }

  _procesarImagen( ImageSource origen ) async {

    foto = await ImagePicker.pickImage(
      source: origen
    );

    if ( foto != null ) {
      aula.fotoUrl = null;
    }

    setState(() {});

  }


}



