import 'package:aurora_movies/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:aurora_movies/features/movies/presentation/widgets/movies_search_bar.dart';
import 'package:aurora_movies/features/movies/presentation/widgets/search_result_movie_tile.dart';
import 'package:aurora_movies/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SearchMoviePage extends StatelessWidget {
  const SearchMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_alt_outlined,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Not Implemented'),
                  content: Text('This feature is not implemented yet, but it will if you hire me!'),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
        title: MoviesSearchBar(onSearch: (query) {
          GetIt.instance<MoviesBloc>().add(SearchMovies(query, 1));
        }),
      ),
      body: BlocConsumer<MoviesBloc, MoviesState>(
          bloc: GetIt.instance<MoviesBloc>(),
          listener: (context, state) {
            if (state is MoviesError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is MoviesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MoviesLoaded) {
              final movies = state.searchedMovies.isNotEmpty ? state.searchedMovies : state.movies;
              return ListView.separated(
                itemCount: movies.length,
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return SearchResultMovieTile(movie: movie);
                },
              );
            }

            return Center(
              child: Text('Search Movie Page'),
            );
          }),
    );
  }
}
