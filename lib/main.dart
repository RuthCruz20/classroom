import 'package:classroom/src/pages/aula_page.dart';
import 'package:classroom/src/pages/home_page.dart';
import 'package:classroom/src/pages/login_page.dart';
import 'package:classroom/src/pages/registro_page.dart';
import 'package:classroom/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:flutter/material.dart';

import 'package:classroom/src/bloc/provider.dart';

 
void main() async{ 
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final prefs = new PreferenciasUsuario();

    print(prefs.token);
    
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login' : ( BuildContext context ) => LoginPage(),
          'registro' : ( BuildContext context ) => RegistroPage(),
          'home'  : ( BuildContext context ) => HomePage(),
          'aula'  : ( BuildContext context ) => AulaPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
      ),
    );
      
  }
}