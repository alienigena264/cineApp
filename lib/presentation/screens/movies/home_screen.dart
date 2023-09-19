import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/widgets.dart';
import 'package:cinemapedia/presentation/providers/movies/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: CustomBottomNavigation(), body: _HomeBody());
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
    super.initState();
    //esto me permite cargar la primera página de películas
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedProvider.notifier).loadNextPage();
    ref.read(upcomingProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final playingMoviesSlide = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingProvider);
    final topRatedMovies = ref.watch(topRatedProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.symmetric(horizontal: 10),
          title: CustomAppBar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              // const CustomAppBar(),
              MoviesSlidesShow(movies: playingMoviesSlide),


              MovieHorizontalListView(
                  movies: nowPlayingMovies,
                  tittle: 'En cines',
                  subtitle: 'Lunes 18',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  }),


              MovieHorizontalListView(
                  movies: popularMovies,
                  tittle: 'Populares',
                  // subtitle: '',
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  }),


              MovieHorizontalListView(
                  movies: upcomingMovies,
                  tittle: 'Próximamente',
                  subtitle: 'Este mes',
                  loadNextPage: () {
                    ref.read(upcomingProvider.notifier).loadNextPage();
                  }),


              MovieHorizontalListView(
                  movies: topRatedMovies,
                  tittle: 'Mejor calificadas',
                  // subtitle: 'Lunes 18',
                  loadNextPage: () {
                    ref.read(topRatedProvider.notifier).loadNextPage();
                  }),
            ],
          );
        },
        childCount: 1,
      ))
    ]);
  }
}
