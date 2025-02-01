import 'package:aurora_movies/features/movies/domain/entities/movie.dart';
import 'package:aurora_movies/features/movies/domain/entities/movies_response.dart';
import 'package:aurora_movies/features/movies/domain/repository/movies_repository.dart';
import 'package:aurora_movies/features/movies/domain/usecases/fetch_popular_movies.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository moviesRepository;

  MoviesBloc({required this.moviesRepository}) : super(MoviesInitial()) {
    on<GetPopularMovies>((event, emit) async {
      emit(MoviesLoading());
      try {
        final MoviesResponse? popularMoviesResponse = await FetchPopularMovies(moviesRepository)(page: 1);
        if (popularMoviesResponse != null) {
          final List<Movie> movies = popularMoviesResponse.results ?? [];
          emit(
            MoviesLoaded(
              movies: movies,
              searchedMovies: [],
              moviesIndex: 0,
              page: 1,
              searchedPage: 1,
              hasMore: (popularMoviesResponse.page ?? 0) < (popularMoviesResponse.totalPages ?? 0),
            ),
          );
        } else {
          emit(MoviesError(message: 'Error loading movies'));
        }
      } catch (e) {
        emit(MoviesError(message: 'Error loading movies'));
      }
    });

    on<GetMorePopularMovies>((event, emit) async {
      if (state is! MoviesLoaded) return;

      final MoviesLoaded moviesLoadedState = state as MoviesLoaded;
      try {
        final MoviesResponse? moviesResponse = await FetchPopularMovies(moviesRepository)(page: event.page);
        if (moviesResponse != null) {
          final List<Movie> newMovies = moviesResponse.results ?? [];
          final List<Movie> movies = [...moviesLoadedState.movies, ...newMovies];
          emit(
            moviesLoadedState.copyWith(
              movies: movies,
              page: event.page,
              hasMore: (moviesResponse.page ?? 0) < (moviesResponse.totalPages ?? 0),
            ),
          );
        } else {
          emit(MoviesError(message: 'Error loading movies'));
        }
      } catch (e) {
        emit(MoviesError(message: 'Error loading movies'));
      }
    });

    on<UpdateMoviesIndex>((event, emit) {
      if (state is MoviesLoaded) {
        final MoviesLoaded moviesLoadedState = state as MoviesLoaded;
        emit(moviesLoadedState.copyWith(moviesIndex: event.index));
      }
    });

    on<SearchMovies>((event, emit) async {
      if (state is! MoviesLoaded) return;
      final MoviesLoaded moviesLoadedState = state as MoviesLoaded;
      emit(MoviesLoading());
      try {
        final MoviesResponse? searchResults = await moviesRepository.searchMovies(query: event.query, page: event.page);
        if (searchResults != null) {
          final List<Movie> movies = searchResults.results ?? [];
          emit(moviesLoadedState.copyWith(
            searchedMovies: movies,
            searchedPage: event.page,
          ));
        } else {
          emit(MoviesError(message: 'Error searching movies'));
        }
      } catch (e) {
        print('Error searching movies: $e');
        emit(MoviesError(message: 'Error searching movies'));
      }
    });
  }
}
