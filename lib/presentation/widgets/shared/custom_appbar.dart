import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context,ref) {
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
                      showSearch(
                          context: context, delegate: SearchMovieDelegate(movieRepository.searchMovies));
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
        ));
  }
}
