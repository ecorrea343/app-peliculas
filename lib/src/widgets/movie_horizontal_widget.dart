import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  
  final List<Pelicula>peliculas;
  final Function siguientePagina;

  MovieHorizontal ({@required this.peliculas,@required this.siguientePagina});
  final _pageController = new PageController(
        initialPage: 1,
        viewportFraction: 0.3
  );
  
  @override
  Widget build(BuildContext context) {

    final _screemSize = MediaQuery.of(context).size;//Para saber el tamaño de patnalla

    _pageController.addListener((){

      if ( _pageController.position.pixels >= _pageController.position.maxScrollExtent - 200) {
          siguientePagina();
      }

    }); 


    

    return Container(
    height:_screemSize.height * 0.3,
    child: PageView.builder(
      pageSnapping: false,
      controller: _pageController,
      itemCount: peliculas.length,
      itemBuilder: (context , i ){
        return _tarjeta(context, peliculas[i]);
      }
      //children: _tarjetas(context),
    ),
      
    );
  }

Widget _tarjeta (BuildContext context, Pelicula pelicula){

  return Container(
        margin: EdgeInsets.only(right: 10.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius:BorderRadius.circular (8.0),
                child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
            SizedBox(height: 5.0,),
            Text(
                pelicula.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
}

  List<Widget> _tarjetas(BuildContext context){

    return peliculas.map((pelicula) {

      return Container(
        margin: EdgeInsets.only(right: 10.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius:BorderRadius.circular (8.0),
                child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 140.0,
              ),
            ),
            SizedBox(height: 5.0,),
            Text(
                pelicula.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );

    }).toList();

  }
}