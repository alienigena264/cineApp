import 'package:animate_do/animate_do.dart';
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
          itemBuilder: (context, index){
            final movie = movies[index];
            return ListTile(
              title: Text(movie.title),
            );
          }
          );
      },
      
      );
  }
}
