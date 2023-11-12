
// cSpell:disable
import 'package:cinemapedia/infrastructure/datasourse/actors_moviedb_datasourse.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repositorie_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Esto es inmutable 
final actorRepositoryProvider = Provider((ref){
  return ActorRepositoryImple(datasource: ActorMovieDbDatasource());

});
/* cSpell:enable */