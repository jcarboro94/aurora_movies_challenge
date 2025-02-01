import 'package:aurora_movies/features/movies/data/models/movies_response.dart';
import 'package:aurora_movies/features/movies/domain/entities/movie.dart';
import 'package:aurora_movies/features/movies/domain/entities/movies_response.dart';
import 'package:aurora_movies/features/movies/domain/repository/movies_repository.dart';
import 'package:aurora_movies/utils/api_manager/api_manager.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final ApiManager _apiManager;

  MoviesRepositoryImpl(this._apiManager);

  @override
  Future<Movie?> getMovieDetails(int movieId) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<MoviesResponse?> searchMovies({required String query, required int page}) async {
    final response = await _apiManager.getPaginatedData(
      endpoint: '/search/movie',
      queryParameters: {'query': query},
      page: page,
    );

    if (response.statusCode == 200) {
      final data = response.data;
      final searchMoviesResponse = MoviesResponseModel.fromJson(data);
      return searchMoviesResponse;
    } else {
      throw Exception('Failed to search movies');
    }
  }

  @override
  Future<MoviesResponse?> getPopularMovies({required int page}) async {
    final response = await _apiManager.getPaginatedData(
      endpoint: '/movie/popular',
      page: page,
    );

    if (response.statusCode == 200) {
      final data = response.data;
      final popularMoviesResponse = MoviesResponseModel.fromJson(data);
      return popularMoviesResponse;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}
