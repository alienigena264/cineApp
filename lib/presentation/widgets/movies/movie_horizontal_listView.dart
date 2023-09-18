import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';


class MovieHorizontalListView extends StatelessWidget {
  final List<Movie> movies;
  final String? tittle;
  final String? subtitle;
  final VoidCallback? loadNextPage;
  const MovieHorizontalListView({super.key, required this.movies, this.tittle, this.subtitle, this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}