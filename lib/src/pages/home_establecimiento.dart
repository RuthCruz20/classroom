import 'package:classroom/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
//import 'package:classroom/src/bloc/provider.dart';
import 'package:classroom/src/providers/establecimientos_provider.dart';
import 'package:classroom/src/models/establecimiento_model.dart';



class HomeEstablecimiento extends StatelessWidget {
  static final String routeName = 'home';
  
  final establecimientosProvider = new EstablecimientosProvider();

  @override
  Widget build(BuildContext context) {

    //final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Establecimientos')
      ),
      drawer: MenuWidget(),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado() {

    return FutureBuilder(
      future: establecimientosProvider.cargarEstablecimientos(),
      builder: (BuildContext context, AsyncSnapshot<List<EstablecimientoModel>> snapshot) {
        if ( snapshot.hasData ) {

          final establecimientos = snapshot.data;

          return ListView.builder(
            itemCount: establecimientos.length,
            itemBuilder: (context, i) => _crearItem(context, establecimientos[i] ),
          );

        } else {
          return Center( child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, EstablecimientoModel establecimiento ) {

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: ( direccion ){
        establecimientosProvider.borrarEstablecimiento(establecimiento.id);
      },
      child: Card(
        child: Column(
          children: <Widget>[            
            ListTile(
              title: Text('${establecimiento.descripcion }'),
              subtitle: Text( establecimiento.id ),
              onTap: () => Navigator.pushNamed(context, 'establecimiento', arguments: establecimiento),
            ),
            IconButton(
              icon: Icon(Icons.map, color: Theme.of(context).primaryColor),
              //onPressed: ()=> utils.abrirScan(context, establecimiento) ,
              onPressed: ()=> Navigator.pushNamed(context, 'mapaEstablecimiento', arguments: establecimiento),
            )
          ],
        ),
      )
    );

  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon( Icons.add ),
      backgroundColor: Colors.deepPurple,
      onPressed: ()=> Navigator.pushNamed(context, 'establecimiento'),
    );
}
}