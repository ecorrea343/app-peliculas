import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/cards_swiper_widget.dart';

class HomePage extends StatelessWidget {

   final peliculasProvider = new PeliculasProvider(); //propiedad de case

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
    
   
      return FutureBuilder(
        future: peliculasProvider.getEnCines(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return CardSwiper( peliculas: snapshot.data, );
          }
          return Container(
            height: 500.0,
            child: Center(child: CircularProgressIndicator()));
        },
      );



   // peliculasProvider.getEnCines();

    // return  CardSwiper(
    //   peliculas: [1,2,3,4,5],
    // );
  }

}