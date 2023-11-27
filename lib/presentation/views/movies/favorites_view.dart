import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  

  @override
  FavoritesViewState createState() => FavoritesViewState();
  
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLoading = false;
  bool isLastPage = false;
  @override
  void initState() {
    super.initState();
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }
  
  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    //TODO: load next page 
  }


  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(favoriteMoviesProvider);
    final moviesList = movies.values.toList();
    return MovieMasonry(movies: moviesList);
  }
}
