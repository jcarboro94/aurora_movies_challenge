import 'package:aurora_movies/features/movies/domain/entities/movie.dart';
import 'package:aurora_movies/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:aurora_movies/features/movies/presentation/widgets/film_cover.dart';
import 'package:aurora_movies/utils/extensions/context.dart';
import 'package:aurora_movies/utils/navigation/route_generator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class MoviesCarousel extends StatelessWidget {
  final List<Movie> movies;
  final bool hasMore;
  final int page;
  final int moviesIndex;

  const MoviesCarousel({
    super.key,
    required this.movies,
    required this.moviesIndex,
    required this.hasMore,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: context.height / 2,
        enlargeCenterPage: true,
        autoPlay: false,
        enableInfiniteScroll: false,
        viewportFraction: 0.6,
        initialPage: moviesIndex,
        onPageChanged: (index, reason) {
          GetIt.instance<MoviesBloc>().add(UpdateMoviesIndex(index));
          if (index == movies.length - 1 && hasMore) {
            GetIt.instance<MoviesBloc>().add(GetMorePopularMovies(page + 1));
          }
        },
      ),
      items: movies.map((movie) {
        return FilmCover(
          movie: movie,
          onPressed: () {
            context.pushNamed(RouteGenerator.moviePage, extra: movie);
          },
        );
      }).toList(),
    );
  }
}
