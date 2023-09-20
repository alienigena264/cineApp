
import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/movie/:id',
      name: MovieScreen.routeName, 
      builder: (context, state) {
        final movieId = state.pathParameters['id']!;


      return  MovieScreen(movieId: movieId,);
      }
      )
]);
