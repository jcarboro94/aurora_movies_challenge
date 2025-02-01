part of 'movies_bloc.dart';

sealed class MoviesState extends Equatable {
  const MoviesState();
}

final class MoviesInitial extends MoviesState {
  @override
  List<Object> get props => [];
}

final class MoviesLoading extends MoviesState {
  @override
  List<Object> get props => [];
}

final class MoviesLoaded extends MoviesState {
  final List<Movie> movies;
  final List<Movie> searchedMovies;
  final int moviesIndex;
  final int page;
  final int searchedPage;
  final bool hasMore;

  const MoviesLoaded({
    required this.movies,
    required this.moviesIndex,
    required this.page,
    required this.hasMore,
    required this.searchedMovies,
    required this.searchedPage,
  });

  MoviesLoaded copyWith(
      {List<Movie>? movies,
      int? moviesIndex,
      int? page,
      bool? hasMore,
      List<Movie>? searchedMovies,
      int? searchedPage}) {
    return MoviesLoaded(
      movies: movies ?? this.movies,
      searchedMovies: searchedMovies ?? this.searchedMovies,
      moviesIndex: moviesIndex ?? this.moviesIndex,
      page: page ?? this.page,
      searchedPage: searchedPage ?? this.searchedPage,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  List<Object> get props => [movies, searchedMovies, moviesIndex, page, searchedPage, hasMore];
}

final class MoviesSearchLoaded extends MoviesState {
  final List<Movie> movies;
  final int page;

  const MoviesSearchLoaded({required this.movies, required this.page});

  MoviesSearchLoaded copyWith({List<Movie>? movies, int? page}) {
    return MoviesSearchLoaded(
      movies: movies ?? this.movies,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [movies, page];
}

final class MoviesError extends MoviesState {
  final String message;

  const MoviesError({required this.message});

  @override
  List<Object> get props => [message];
}
