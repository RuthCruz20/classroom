

import 'package:flutter/material.dart';
import 'package:classroom/src/providers/establecimientos_provider.dart';
import 'package:classroom/src/models/establecimiento_model.dart';

class DataSearch extends SearchDelegate {

  final establecimientoProvider = new EstablecimientosProvider();
  
  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.cancel),
        onPressed: (){
            query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe
    if( query.isEmpty ){
      return Container();
    }  
    
    return FutureBuilder(
      future: establecimientoProvider.buscarEstablecimiento(query),
      builder: (context, AsyncSnapshot<List<EstablecimientoModel>> snapshot) {
        
        if( snapshot.hasData ){
          
          final establecimientos = snapshot.data;
          
          return ListView(
            children: establecimientos.map((establecimientos){
              return ListTile(
                leading: Icon(
                  Icons.location_city,
                ),
                title: Text( establecimientos.id ),
                subtitle: Text( establecimientos.descripcion ),
              );
            }).toList()
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }



}