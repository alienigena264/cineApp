import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
      ),
    ));
  }
}
