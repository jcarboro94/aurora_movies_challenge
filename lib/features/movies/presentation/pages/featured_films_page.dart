import 'package:aurora_movies/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:aurora_movies/features/movies/presentation/widgets/movies_carousel.dart';
import 'package:aurora_movies/features/movies/presentation/widgets/search_button.dart';
import 'package:aurora_movies/utils/extensions/context.dart';
import 'package:aurora_movies/utils/navigation/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class FeaturedFilmsPage extends StatelessWidget {
  const FeaturedFilmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        child: BlocConsumer<MoviesBloc, MoviesState>(
            bloc: GetIt.instance<MoviesBloc>(),
            listener: (context, state) {
              if (state is MoviesError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                ));
              }
              if (state is MoviesSearchLoaded) {
                GetIt.instance<MoviesBloc>().add(RestorePreviousMovies());
              }
            },
            builder: (context, state) {
              if (state is MoviesInitial) {
                GetIt.instance<MoviesBloc>().add(GetPopularMovies());
              }
              if (state is MoviesSearchLoaded) {
                GetIt.instance<MoviesBloc>().add(RestorePreviousMovies());
              }

              if (state is MoviesLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Spacer(),
                    Text(
                      'Featured Films',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    MoviesCarousel(
                      movies: state.movies,
                      moviesIndex: state.moviesIndex,
                      hasMore: state.hasMore,
                      page: state.page,
                    ),
                    Spacer(),
                    SearchButton(
                      onPressed: () => context.pushNamed(RouteGenerator.searchMoviePage).then((_) {
                        GetIt.instance<MoviesBloc>().add(RestorePreviousMovies());
                      }),
                    ),
                    Spacer(),
                  ],
                );
              }

              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
