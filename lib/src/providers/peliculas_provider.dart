import 'dart:async';
import 'dart:convert';
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {

String _apikey     = 'bf944468c2afd7b5904f5faf77db915b';
String _url        = 'api.themoviedb.org';
String _language   = 'es-ES';
int _popularesPage =  0;
bool _cargando     =  false;

List<Pelicula> _populares = new List();
final _popularesStreamController = StreamController<List<Pelicula>>.broadcast(); //modificacion video 109

Function(List<Pelicula>)get popularesSink => _popularesStreamController.sink.add;

Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

void disposeStreams(){
  _popularesStreamController?.close();
}

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

    if (_cargando) return [];
    _cargando = true;
    _popularesPage++; //modificacion hecha en el video 109 - Creando un Stream de Peliculas

    print('Cargando Siguientes.....');
  final url  = Uri.https(_url,'3/movie/popular',{
    'api_key' : _apikey,
    'language': _language,
    'page'    : _popularesPage.toString()
  });
    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);
    popularesSink(_populares);
    _cargando = false;
    return resp;

  }

  Future<List<Actor>>getCast(String pelisId)async{

    final url =   Uri.https(_url, '3/movie/$pelisId/credits',{

      'api_key' : _apikey,
      'language': _language

    });
    final resp        = await http.get(url);
    final decodedData = json.decode(resp.body);

    final casting = new Cast.fromJsonList(decodedData['cast']);

    return casting.actores;

  }

    Future<List<Pelicula>> buscarPelicula( String query )async{

  final url = Uri.https(_url,'3/search/movie',{
    'api_key'  : _apikey,
    'language' : _language,
    'query'    : query
  });

  return await _procesarRespuesta(url);
}
}