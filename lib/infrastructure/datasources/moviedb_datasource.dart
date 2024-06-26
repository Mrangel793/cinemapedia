
import 'package:dio/dio.dart';

import 'package:cinemapedia/constants/environment.dart';
import 'package:cinemapedia/domain/datasource/movies_datasource.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource{

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }
    ),
    );
  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{

    final response = await dio.get('/movie/now_playing');
    final List<Movie> movies = MovieDbResponse.fromJson(response.data)
    .results
    .where((moviedb) => moviedb.posterPath != 'No-Poster')
    .map((moviedb) => MovieMapper.movieDBToEntity(moviedb)).toList();

   return movies;
  }

}