import 'package:aurora_movies/features/movies/domain/entities/movies_response.dart';
import 'package:aurora_movies/features/movies/domain/repository/movies_repository.dart';

class FetchPopularMovies {
  final MoviesRepository _repository;

  FetchPopularMovies(this._repository);

  Future<MoviesResponse?> call({
    required int page,
  }) async {
    return await _repository.getPopularMovies(
      page: page,
    );
  }
}
