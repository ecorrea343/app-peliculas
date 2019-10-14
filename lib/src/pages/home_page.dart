import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en Cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
          child: Column(
            children: <Widget>[
            Text('Hola Mundo'),
              _swipeTarjetas(),
            ],
          ),

      )
      
      
    );
  }
  Widget _swipeTarjetas(){
    
    return  Container(
      
      //Contenido agregado en el video 97 - Crear un swiper de Tarjetas.
      padding: EdgeInsets.only(top: 15.0),
      width : double.infinity,
      height: 300.0,


      child: Swiper(
        
          layout:SwiperLayout.STACK ,
          itemWidth: 240.0,
          itemBuilder: (BuildContext context,int index){
            return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
          },
          itemCount: 3,
         // pagination: new SwiperPagination(),
          //control: new SwiperControl(),
        ),
    );
  }

}