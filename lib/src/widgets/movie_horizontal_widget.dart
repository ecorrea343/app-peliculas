import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  
  final List<Pelicula>peliculas;

  MovieHorizontal ({@required this.peliculas});
  
  @override
  Widget build(BuildContext context) {

    final _screemSize = MediaQuery.of(context).size;

    return Container(
    height:_screemSize.height * 0.3,
    child: PageView(
      pageSnapping: false,
      controller: PageController(
        initialPage: 1,
        viewportFraction: 0.3
      ),
      children: _tarjetas(),
    ),
      
    );
  }

  List<Widget> _tarjetas(){

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
                height: 150.0,
              ),
            )
          ],
        ),
      );

    }).toList();

  }
}