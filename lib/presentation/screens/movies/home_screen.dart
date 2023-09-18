import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _HomeBody());
  }
}

class _HomeBody extends ConsumerStatefulWidget {
  const _HomeBody();

  @override
  __HomeBodyState createState() => __HomeBodyState();
}

class __HomeBodyState extends ConsumerState<_HomeBody> {
  @override
  void initState() {
    // ref
    super.initState();
    final movies = ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    return ListView.builder(
      itemCount: nowPlayingMovies.length,
      itemBuilder: (context, index) {
        final movie = nowPlayingMovies[index];
        index == 1 ? print(movie.posterPath): null;
        return ListTile(
          title: Text(movie.title, style: const TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text(movie.posterPath),
          // leading: Image.network(
          //   'movie.posterPath',
          //   width: 200,
          //   height: 200,
          //   fit: BoxFit.cover,
          // ),
        );
      },
    );
  }
}
