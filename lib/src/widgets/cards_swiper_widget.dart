import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  
  final List<Pelicula>peliculas;

  CardSwiper({@required this.peliculas});
  
  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;
    
    
    
    
    return Container(
      
      //Contenido agregado en el video 97 - Crear un swiper de Tarjetas.
      padding: EdgeInsets.only(top: 15.0),

           child: Swiper(
        
          layout:SwiperLayout.STACK ,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          itemBuilder: (BuildContext context,int index){
            return ClipRRect(
               
                borderRadius: BorderRadius.circular(15.0),
                child: FadeInImage(
                  image: NetworkImage( peliculas[index].getPosterImg() ),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                )
            ); 
                           
            },
          itemCount: peliculas.length,
         // pagination: new SwiperPagination(),
          //control: new SwiperControl(),
        ),
    );
  }
}