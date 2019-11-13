
import 'package:flutter/material.dart';
import 'package:classroom/src/providers/aulas_provider.dart';
import 'package:classroom/src/search/search_delegate.dart';
import 'package:classroom/src/widgets/menu_widget.dart';



class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  
  final aulasProvider = new AulasProvider();

  @override
  Widget build(BuildContext context) {

    //final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Image(
                image: AssetImage('assets/logo1.jpeg'),
                ),
      ),
    );
  }

Widget _cuerpo(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.only(top: 200),
            child: Image(
              image: AssetImage('assets/logo1.jpeg'),
              ),
          )
        ],
      ),
    );
  }

}