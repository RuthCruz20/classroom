
import 'package:flutter/material.dart';
//import 'package:classroom/src/bloc/provider.dart';
import 'package:classroom/src/providers/aulas_provider.dart';
import 'package:classroom/src/models/aula_model.dart';
import 'package:classroom/src/search/search_delegate.dart';
import 'package:classroom/src/widgets/menu_widget.dart';



class HomeAulaPage extends StatelessWidget {
  static final String routeName = 'aulas';
  
  final aulasProvider = new AulasProvider();

  @override
  Widget build(BuildContext context) {

    //final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Aulas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                context: context,
                delegate: DataSearch(),
                //query: 'Hola'
                );
            },
          )
        ],
      ),
      drawer: MenuWidget(),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado() {

    return FutureBuilder(
      future: aulasProvider.cargarAulas(),
      builder: (BuildContext context, AsyncSnapshot<List<AulaModel>> snapshot) {
        if ( snapshot.hasData ) {

          final aulas = snapshot.data;

          return ListView.builder(
            itemCount: aulas.length,
            itemBuilder: (context, i) => _crearItem(context, aulas[i] ),
          );

        } else {
          return Center( child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, AulaModel aula ) {

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: ( direccion ){
        aulasProvider.borrarAula(aula.id);
      },
      child: Card(
        child: Column(
          children: <Widget>[

            ( aula.fotoUrl == null ) 
              ? Image(image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                image: NetworkImage( aula.fotoUrl ),
                placeholder: AssetImage('assets/jar-loading.gif'),
                height: 300.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            
            ListTile(
              title: Text('Nombre: ${ aula.nombre } - Establecimiento: ${aula.establecimiento.descripcion}'),
              subtitle: Text( aula.id ),
              onTap: () => Navigator.pushNamed(context, 'aula', arguments: aula ),
            ),
            IconButton(
              icon: Icon(Icons.map, color: Theme.of(context).primaryColor),
              //onPressed: ()=> utils.abrirScan(context, establecimiento) ,
              onPressed: ()=> Navigator.pushNamed(context, 'mapaEstablecimiento', arguments: aula.establecimiento),
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
      onPressed: ()=> Navigator.pushNamed(context, 'aula'),
    );
}
}