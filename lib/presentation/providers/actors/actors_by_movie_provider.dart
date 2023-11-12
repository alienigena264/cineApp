import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actros_repository_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/*Formato de la lista de actores por película
{
  '58555':<Actor>[]
  '58555':<Actor>[]
  '58555':<Actor>[]
  '58555':<Actor>[]
}

*/
final movieInfoProvider =
    StateNotifierProvider<ActorByMovieMapNotifier, Map<String, List<Actor>>>((ref) =>
        ActorByMovieMapNotifier(ref.watch(actorRepositoryProvider).getActorsByMovie));

typedef GetActorByMovieCallBack = Future<List<Actor>> Function(String movieId);

class ActorByMovieMapNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorByMovieCallBack getActorByMovieById;

  ActorByMovieMapNotifier( 
    
    this.getActorByMovieById) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final actors = await getActorByMovieById(movieId);

    state = {...state, movieId: actors};
  }
}
