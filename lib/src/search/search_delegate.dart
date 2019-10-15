import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {

  String seleccion = '';
  final peliculasProvider = new PeliculasProvider();

  final peliculas = [
        
    'Spiderman',
    'Superman',
    'Captain',
    'Shazam',
    'Iron Man',
    'Spiderman',
    'Spiderman',
    'Spiderman'
  
  
  ];

  final peliculasRecientes = [

    'Spiderman',

    'hentai'

  ];





  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones para nuestro Appbar
    return [
      IconButton(
        icon      : Icon(Icons.clear),
        onPressed : ()
        {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del Appbar
    return IconButton(
        icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Builder -Crea los resultados que vamos a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias cuando la persona escribe

    if ( query.isEmpty) {
      return Container();  
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot <List<Pelicula>>snapshot) {
        if (snapshot.hasData) {

          final peliculas = snapshot.data; // solo para abreviar

          return ListView(
            children: peliculas.map((pelicula){

              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
              );

            }).toList()
          );
          
        }else{
          return Center(
            child:CircularProgressIndicator());
        }
      },
    );
  
  }

  //  @override
  // Widget buildSuggestions(BuildContext context) {
  //   // Son las sugerencias cuando la persona escribe
  //   // modificacion del archivo en el video 122.
  //   // final listaSugerida = ( query.isEmpty ) ? peliculasRecientes :
  //   //  peliculas.where((p)=>p.toLowerCase().startsWith(query.toLowerCase())).toList();


  //   // return ListView.builder(
  //   //   itemCount: listaSugerida.length,
  //   //   itemBuilder: (context,i){
  //   //     return ListTile(
  //   //       leading: Icon(Icons.movie),
  //   //       title: Text(listaSugerida[i]),
  //   //       onTap: (){
  //   //         seleccion = listaSugerida[i];
  //   //         showResults(context);
  //   //       },
  //   //     );
  //   //   },
  //   // );
  // }


}