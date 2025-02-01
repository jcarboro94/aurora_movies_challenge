import 'package:aurora_movies/features/movies/domain/entities/movie.dart';
import 'package:aurora_movies/features/movies/presentation/pages/featured_films_page.dart';
import 'package:aurora_movies/features/movies/presentation/pages/movie_page.dart';
import 'package:aurora_movies/features/movies/presentation/pages/search_movie_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteGenerator {
  static const String initialRoute = '/';
  static const String moviePage = '/moviePage';
  static const String searchMoviePage = '/searchMoviePage';

  static final GoRouter router = GoRouter(
    initialLocation: RouteGenerator.initialRoute,
    routes: <GoRoute>[
      GoRoute(
        path: RouteGenerator.initialRoute,
        name: RouteGenerator.initialRoute,
        builder: (BuildContext context, GoRouterState state) => FeaturedFilmsPage(),
      ),
      GoRoute(
        path: RouteGenerator.moviePage,
        name: RouteGenerator.moviePage,
        builder: (context, state) {
          final movie = state.extra! as Movie;

          return MoviePage(
            movie: movie,
          );
        },
      ),
      GoRoute(
          path: RouteGenerator.searchMoviePage,
          name: RouteGenerator.searchMoviePage,
          builder: (context, state) => SearchMoviePage()),
    ],
    errorBuilder: (context, state) => Container(color: Colors.red),
  );
}
