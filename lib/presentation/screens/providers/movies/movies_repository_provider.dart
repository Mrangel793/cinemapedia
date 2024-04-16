
import 'package:cinemapedia/domain/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/domain/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este provider es de solo lectura, osea es inmutable
//Su objetivo es proporcionar a todos los demas providers, la informacion necesaria
//que pueda tener el repository
final movieRepositoryProvider = Provider((ref) {

  //retornamos el repository Implementation, 
  //y el datasource donde tenemos la implementacion de los metodos y la conexion a la api
  return MovieRepositoryImpl(MoviedbDatasource());
});