part of 'movies_bloc.dart';

sealed class MoviesEvent extends Equatable {
  const MoviesEvent();
}

final class GetPopularMovies extends MoviesEvent {
  @override
  List<Object> get props => [];
}

final class GetMorePopularMovies extends MoviesEvent {
  final int page;

  const GetMorePopularMovies(this.page);

  @override
  List<Object> get props => [page];
}

final class GetMovieDetails extends MoviesEvent {
  final int movieId;

  const GetMovieDetails(this.movieId);

  @override
  List<Object> get props => [movieId];
}

final class SearchMovies extends MoviesEvent {
  final String query;
  final int page;

  const SearchMovies(this.query, this.page);

  @override
  List<Object> get props => [query];
}

final class UpdateMoviesIndex extends MoviesEvent {
  final int index;

  const UpdateMoviesIndex(this.index);

  @override
  List<Object> get props => [index];
}

final class RestorePreviousMovies extends MoviesEvent {
  @override
  List<Object> get props => [];
}
