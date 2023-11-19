import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

import 'package:flutter/material.dart';

typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  SearchMovieDelegate(this.searchMoviesCallBack);

  //Con esto cambio el preview de la búsqueda
  @override
  String get searchFieldLabel => 'Buscar película';

  final SearchMoviesCallBack searchMoviesCallBack;

  //Esto es la parte derecha del search, el icono de la lupa
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        FadeIn(
          duration: const Duration(milliseconds: 150),
          //query es lo que hay dentro de la barra de búsqueda y se actualiza en cada tap
          child: IconButton(
              onPressed: () => query = '',
              icon: const Icon(Icons.clear_rounded)),
        )
    ];
  }

  //Esta es la parte izquierda del search, el icono de la flecha o  nada
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios));
  }

  //Esto es como se ven los resultados de búsqueda
  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults  ');
  }

  //Esto es como se ven la sugerencias de búsqueda
  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMoviesCallBack(query),
      initialData: const [],
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return _MovieItem(
                movie: movies[index],
                onMovieSelected: close,
              );
            });
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  const _MovieItem({required this.movie, required this.onMovieSelected});

  final Movie movie;
  final Function onMovieSelected;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: size.width * 0.6,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title, style: textStyle.titleMedium),
                    movie.overview.length >= 150
                        ? Text('${movie.overview.substring(0, 150)}...')
                        : Text(movie.overview),
                    Row(
                      children: [
                        Icon(
                          Icons.star_half_rounded,
                          color: Colors.yellow.shade800,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          HumanFormats.number(movie.voteAverage, 1),
                          style: textStyle.bodyMedium!
                              .copyWith(color: Colors.yellow.shade800),
                        ),
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
