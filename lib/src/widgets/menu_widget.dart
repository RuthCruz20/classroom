import 'package:flutter/material.dart';

import 'package:classroom/src/pages/home_page.dart';


class MenuWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),

          ListTile(
            leading: Icon( Icons.pages, color: Colors.blue ),
            title: Text('Home'),
            onTap: ()=> Navigator.pushReplacementNamed(context, HomePage.routeName ) ,
          ),

          ListTile(
            leading: Icon( Icons.calendar_today, color: Colors.blue ),
            title: Text('Horario Aula1'),
            onTap: ()=> Navigator.pushReplacementNamed(context, 'horarioAula' ),
          ),
          ListTile(
            leading: Icon( Icons.calendar_today, color: Colors.blue ),
            title: Text('Horario Aula 2'),
            onTap: ()=> Navigator.pushReplacementNamed(context, 'calendario' ),
          ),

          ListTile(
            leading: Icon( Icons.people, color: Colors.blue ),
            title: Text('Establecimientos'),
            onTap: ()=> Navigator.pushReplacementNamed(context, 'homeEstablecimiento' ) ,
          ),

          ListTile(
            leading: Icon( Icons.settings, color: Colors.blue ),
            title: Text('Settings'),
            onTap: (){
              // Navigator.pop(context);
            }
          ),

        ],
      ),
    );
  }
}