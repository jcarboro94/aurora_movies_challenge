import 'dart:convert';

import 'package:aurora_movies/features/movies/data/models/movie.dart';
import 'package:aurora_movies/features/movies/domain/entities/movie.dart';
import 'package:aurora_movies/features/movies/domain/entities/movies_response.dart';

class MoviesResponseModel extends MoviesResponse {
  MoviesResponseModel({
    int page = 1,
    List<Movie> results = const [],
    int totalPages = 1,
    int totalResults = 0,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  MoviesResponseModel copyWith({
    int? page,
    List<Movie>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      MoviesResponseModel(
        page: page ?? this.page!,
        results: results ?? this.results!,
        totalPages: totalPages ?? this.totalPages!,
        totalResults: totalResults ?? this.totalResults!,
      );

  factory MoviesResponseModel.fromRawJson(String str) => MoviesResponseModel.fromJson(json.decode(str));

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) => MoviesResponseModel(
        page: json["page"],
        results: json["results"] == null ? [] : List<Movie>.from(json["results"]!.map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
