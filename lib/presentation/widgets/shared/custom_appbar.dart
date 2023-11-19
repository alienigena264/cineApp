import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';


class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final textTittle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(
                  Icons.movie_creation_outlined,
                  size: 30,
                  color: colors.primary,
                ),
                Text(
                  '  Cinemapedia',
                  style: textTittle,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      final movieRepository = ref.read(movieRepositoryProvider);
                      showSearch<Movie?>(
                              context: context,
                              delegate: SearchMovieDelegate(
                                  movieRepository.searchMovies))
                          .then((movie) {
                        if (movie == null) return;
                        context.push('/movie/${movie.id}');
                      });
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
        ));
  }
}
