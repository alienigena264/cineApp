import 'package:cinemapedia/domain/entities/actor.dart';

abstract class ActorsRepositorie {
  Future<List<Actor>> getActorsByMovie(int movieId);
}