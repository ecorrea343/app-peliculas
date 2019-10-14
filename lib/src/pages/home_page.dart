import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/widgets/cards_swiper_widget.dart';

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
    
    return  CardSwiper(
      peliculas: [1,2,3,4,5],
    );
  }

}