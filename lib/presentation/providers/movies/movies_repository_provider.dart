
// cSpell:disable
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infrastructure/datasourse/moviedb_dataesourse.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
//Esto es inmutable 
final movieRepositoryProvider = Provider((ref){
  return MovieRepositoryImpl(datasource: MovieDbDatasource());

});
/* cSpell:enable */