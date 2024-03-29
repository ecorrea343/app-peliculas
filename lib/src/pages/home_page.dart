import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';
import 'package:peliculas/src/widgets/cards_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal_widget.dart';

class HomePage extends StatelessWidget {

   final peliculasProvider = new PeliculasProvider(); //propiedad de case

  @override
  Widget build(BuildContext context) {

    peliculasProvider.getPopulares(); // cambios realziados en el video 110.

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en Cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: Container(
          child: Column(
            children: <Widget>[
            //Text('Hola Mundo'),
              _swipeTarjetas(),
              _footer(context),
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

  Widget _footer(BuildContext context){

    return Container(

      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Populares', style: Theme.of(context).textTheme.subhead)),
          SizedBox(height: 5.0,),

         StreamBuilder(

              stream: peliculasProvider.popularesStream,
              
              builder: (BuildContext context, AsyncSnapshot <List>snapshot) {
               
                //snapshot.data?.forEach((p) => print(p.title));
                 if (snapshot.hasData) {
                  return MovieHorizontal(
                    peliculas : snapshot.data,
                    siguientePagina: peliculasProvider.getPopulares ,);
                  
                 }else{
                   return Center(child: CircularProgressIndicator());
                 }
               
              
              },
            ),
        ],
      ),
    );
  }
}