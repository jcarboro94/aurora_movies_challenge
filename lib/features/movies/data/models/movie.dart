import 'package:aurora_movies/features/movies/domain/entities/movie.dart';
import 'package:aurora_movies/utils/api_manager/api_manager.dart';
import 'package:get_it/get_it.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.title,
      required super.posterPath,
      required super.overview,
      required super.releaseDate,
      required super.voteAverage});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final apiManager = GetIt.instance<ApiManager>();
    final fullPosterPath = apiManager.getImageUrl(json['poster_path'] ?? '');
    return MovieModel(
      title: json['title'],
      posterPath: json['poster_path'] != null ? fullPosterPath : '',
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': super.title,
      'poster_path': super.posterPath,
      'overview': super.overview,
      'release_date': super.releaseDate,
      'vote_average': super.voteAverage,
    };
  }
}
