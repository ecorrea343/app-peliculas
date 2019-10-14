
import 'dart:convert';


import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {

String _apikey    = 'bf944468c2afd7b5904f5faf77db915b';
String _url       = 'api.themoviedb.org';
String _language  = 'es-ES';

Future<List<Pelicula>> _procesarRespuesta(Uri url) async {

  final respuesta = await http.get(url);
  final decodedData = json.decode(respuesta.body);

  final peliculas = new Peliculas.fromJsonList(decodedData['results']);
  //print(decodedData['results']);

    return peliculas.items;
}





Future<List<Pelicula>> getEnCines()async{

  final url = Uri.https(_url,'3/movie/now_playing',{
    'api_key'  : _apikey,
    'language' : _language
  });

  return await _procesarRespuesta(url);
}

  Future<List<Pelicula>>getPopulares() async {


  final url  = Uri.https(_url,'3/movie/popular',{
    'api_key' : _apikey,
    'language': _language
  });
  
    return await _procesarRespuesta(url);
  


}


}