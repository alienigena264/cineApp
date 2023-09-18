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
      bottomNavigationBar: CustomBottomNavigation(),
      body: _HomeBody());
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
    // ignore: unused_local_variable
    final movies = ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final playingMoviesSlide = ref.watch(moviesSlideShowProvider);

    return Column(
      children: [
        const CustomAppBar(),
        MoviesSlidesShow(movies: playingMoviesSlide),

        MovieHorizontalListView(movies: nowPlayingMovies)

      ],
    );
  }
}
