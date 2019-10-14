import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  
  final List<dynamic>peliculas;

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
                child: Image.network("http://via.placeholder.com/350x150",fit: BoxFit.cover,),
            ); 
                           
            },
          itemCount: peliculas.length,
         // pagination: new SwiperPagination(),
          //control: new SwiperControl(),
        ),
    );
  }
}