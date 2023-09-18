// cSpell:disable

import 'package:cinemapedia/domain/datasourse/movies_datasourse.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDatasource datasource;
  MovieRepositoryImpl({required this.datasource});

  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) {
    return datasource.getNowPlayingMovies(page: page);
  }

}
/* cSpell:enable */