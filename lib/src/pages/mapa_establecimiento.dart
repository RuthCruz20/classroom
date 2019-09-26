import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:classroom/src/models/establecimiento_model.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  String tipoMapa = 'streets';

  final MapController map = new MapController();

  @override
  Widget build(BuildContext context) {

    final EstablecimientoModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){
              map.move(scan.getLatLng(), 15);
            },
          ) 
        ],
      ),
      body: _crearFlutterMap(scan),
      floatingActionButton: _crearBotonFlotante(context ),
    );
  }    

  Widget _crearBotonFlotante(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.repeat),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: (){
        //streets, dark, light, outdoors, satellite
        if(tipoMapa=='streets'){
          tipoMapa= 'dark';
        }else if (tipoMapa == 'dark'){
          tipoMapa = 'light';
        }else if (tipoMapa == 'light'){
          tipoMapa = 'outdoors';
        }else if (tipoMapa == 'outdoors'){
          tipoMapa = 'satellite';
        }else{
          tipoMapa = 'streets';
        }
        setState(() {});  
        
      },
    );
  }

  Widget _crearFlutterMap(EstablecimientoModel scan) {
    return FlutterMap(
      mapController: map,
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 15
      ),
      layers: [
        _crearMapa(),
        _crearMarcadores(scan),
      ],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken' : 'pk.eyJ1IjoicnV0aGNydXoiLCJhIjoiY2swcDljbHIwMDM2ODNjbjBzbWxlcjU5cSJ9.mm1QN0ks7xr1rXdeJWnLqA',
        'id'         : 'mapbox.$tipoMapa'
        //streets, dark, light, outdoors, satellite estos son los 5 tipos de mapas que tenemos
        //solo cambio en el id .por el tipo que deceo
      }
    );
  }

  _crearMarcadores(EstablecimientoModel scan) {
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          //instrucion para que se dibuje el marcador
          builder: (context)=> Container(
            child: Icon(
              Icons.location_on,
              size: 70.0,
              color: Theme.of(context).primaryColor,
            ),
          )
        )
      ]
    );
  }
}

