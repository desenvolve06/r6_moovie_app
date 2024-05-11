import 'package:flutter/material.dart';
import '../../../data/models/movies_model.dart';
import 'arch_banner_image.dart';

class MovieDetailHeader extends StatelessWidget {
  const MovieDetailHeader({
    Key? key,
    required this.movie,
    required this.height,
    required this.posterUrl,
  }) : super(key: key);

  final MoviesModels movie;
  final double height;
  final String posterUrl;

  List<Widget> _buildCategoryChips(TextTheme textTheme) {
    return movie.genreIds!.map((category) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(movie.voteAverage.toString()),
          labelStyle: textTheme.caption,
          backgroundColor: Colors.black12,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: ArcBannerImage("https://image.tmdb.org/t/p/w500${movie.backdropPath}"),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // Define o arredondamento da imagem
                  child: Image.network(
                    ("https://image.tmdb.org/t/p/w500${movie.backdropPath}"),
                    fit: BoxFit.cover,
                    width: 70,
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(width: 270),
            ],
          ),
        ),
      ],
    );
  }
}
