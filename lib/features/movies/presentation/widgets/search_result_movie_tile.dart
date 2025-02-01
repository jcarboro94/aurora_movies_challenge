import 'package:aurora_movies/features/movies/domain/entities/movie.dart';
import 'package:aurora_movies/utils/navigation/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchResultMovieTile extends StatelessWidget {
  final Movie movie;
  const SearchResultMovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: movie.posterPath != ''
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                movie.posterPath,
              ),
            )
          : SizedBox(),
      title: Text(
        movie.title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        movie.overview,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () => context.go(
        RouteGenerator.moviePage,
        extra: movie,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
