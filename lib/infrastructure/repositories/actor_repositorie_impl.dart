// cSpell:disable
import 'package:cinemapedia/domain/datasource/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImple extends ActorsRepository{
  final ActorsDatasource datasource;

  ActorRepositoryImple({required this.datasource});
  
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }

}
/* cSpell:enable */