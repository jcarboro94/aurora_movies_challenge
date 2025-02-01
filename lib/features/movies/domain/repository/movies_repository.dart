import 'package:aurora_movies/features/movies/domain/entities/movie.dart';
import 'package:aurora_movies/features/movies/domain/entities/movies_response.dart';

abstract class MoviesRepository {
  Future<MoviesResponse?> getPopularMovies({required int page});
  Future<MoviesResponse?> searchMovies({required String query, required int page});
  Future<Movie?> getMovieDetails(int movieId);
}
