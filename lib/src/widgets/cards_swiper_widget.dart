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
          itemWidth: _screenSize.width * 0.6,
          itemHeight: _screenSize.height * 0.498,//0.47,
          itemBuilder: (BuildContext context,int index){
            
            peliculas[index].uniqueId = '${ peliculas[index].id }-tarjeta';
            
            return Hero(
                  tag: peliculas[index].uniqueId,
                  child: ClipRRect(
                 
                  borderRadius: BorderRadius.circular(20.0),
                  child: GestureDetector(
                      onTap: ()=> Navigator.pushNamed(context,'detalle',arguments: peliculas[index]),
                                      child: FadeInImage(

                        image: NetworkImage( peliculas[index].getPosterImg() ),
                        placeholder: AssetImage('assets/img/no-image.jpg'),
                        fit: BoxFit.fill,
                        
                    ),
                  )
              ),
            ); 
                           
            },
          itemCount: peliculas.length,
         // pagination: new SwiperPagination(),
          //control: new SwiperControl(),
        ),
    );
  }
}