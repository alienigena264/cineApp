
// cSpell:disable
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasourse/movies_datasourse.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

          /* cSpell:enable */
class MovieDbDatasource implements MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': environment.theMovieDbKey,
        'language': 'es-CL',
      }
    
    ),
  );
  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    final response = Dio().get('/movie/now_playing');
    final List<Movie> movies = [];
    
    return [];
  }
}
