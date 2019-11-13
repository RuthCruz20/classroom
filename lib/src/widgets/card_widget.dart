import 'package:classroom/src/models/aula_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {

  final List<AulaModel> aulas;

  CardSwiper ({ @required this.aulas});


  @override
  Widget build(BuildContext context) {
    final _screnSize = MediaQuery.of(context).size;//para sacar el tamaño de la pantalla con la que esta trabajando
    
    return Container(
      /*padding: EdgeInsets.only(top: 10.0 ),
      child: Swiper(
          layout: SwiperLayout.STACK,
          itemWidth: _screnSize.width * 0.6,//usa todo el ancho posible
          itemHeight: _screnSize.height * 0.5,
          itemBuilder: (BuildContext context,int index){

            aulas[index].unicId = '${aulas[index].id}-tarjeta';

            return  Hero(
              tag: aulas[index].unicId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: ()=>Navigator.pushNamed(context, 'detalle', arguments: peliculas[index]),
                  child: FadeInImage(
                    image: NetworkImage( aulas[index].getPosterImg() ),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.cover ,
                  ),
                ),
                //child: Text(peliculas[index].toString()),
              ),
            );
          },
          itemCount: aulas.length,
          //pagination: new SwiperPagination(),//numero de paginas
          //control: new SwiperControl(),//la flechite costado para cambiar
        ),*/
    );

  }
}