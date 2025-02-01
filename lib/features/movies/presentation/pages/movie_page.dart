import 'package:aurora_movies/features/movies/domain/entities/movie.dart';
import 'package:aurora_movies/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:aurora_movies/features/movies/presentation/widgets/cover_overlay.dart';
import 'package:aurora_movies/utils/navigation/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class MoviePage extends StatelessWidget {
  final Movie movie;
  const MoviePage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: movie.posterPath == ""
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  final state = GetIt.instance<MoviesBloc>().state;
                  if (state is! MoviesLoaded) {
                    GetIt.instance<MoviesBloc>().add(GetMorePopularMovies(1));
                  }
                  context.pushNamed(RouteGenerator.initialRoute);
                },
                icon: CircleAvatar(
                  child: Icon(
                    Icons.adaptive.arrow_back,
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: movie.posterPath,
              child: Stack(
                children: [
                  movie.posterPath != ''
                      ? Image.network(
                          movie.posterPath,
                          fit: BoxFit.cover,
                        )
                      : SizedBox(
                          height: 100,
                        ),
                  Positioned.fill(
                    child: CoverOverlay(),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 16,
                    left: 24,
                    child: IconButton(
                      onPressed: () {
                        final state = GetIt.instance<MoviesBloc>().state;
                        if (state is! MoviesLoaded) {
                          GetIt.instance<MoviesBloc>().add(GetMorePopularMovies(1));
                        }
                        context.pushNamed(RouteGenerator.initialRoute);
                      },
                      icon: CircleAvatar(
                        child: Icon(
                          Icons.adaptive.arrow_back,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Text(movie.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                  Text(movie.overview, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
