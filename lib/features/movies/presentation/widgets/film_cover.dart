import 'package:aurora_movies/features/movies/domain/entities/movie.dart';
import 'package:aurora_movies/features/movies/presentation/widgets/cover_overlay.dart';
import 'package:flutter/material.dart';

class FilmCover extends StatelessWidget {
  final Movie movie;
  final void Function()? onPressed;
  const FilmCover({super.key, required this.movie, this.onPressed});

  final double aspectRatio = 0.66;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: InkWell(
              onTap: onPressed,
              child: Hero(
                tag: movie.posterPath,
                child: Stack(
                  children: [
                    Container(
                      height: (size.width / 1.5) / aspectRatio,
                      width: (size.width / 1.5),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(movie.posterPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(child: CoverOverlay()),
                  ],
                ),
              ),
            ),
          ),
        ),
        Text(
          movie.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          movie.voteAverage.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
