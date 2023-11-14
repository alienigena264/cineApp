// cSpell:disable
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasource/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';
/* cSpell:enable */

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
      'api_key': environment.theMovieDbKey,
      'language': 'es-CL',
    }),
  );

//Functions
  List<Actor> _jsonToActor(Map<String, dynamic> json) {
    final actorResponse = CreditsResponse.fromJson(json);
    final List<Actor> actor = actorResponse.cast
        .map((movieDb) => ActorMapper.castToEntity(movieDb))
        .toList();
    return actor;
  }

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response =
        await dio.get('/movie/$movieId/credits', queryParameters: {});
    return _jsonToActor(response.data);
  }
}
