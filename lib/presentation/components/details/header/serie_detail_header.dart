import 'package:flutter/material.dart';
import 'package:r6_moovie_app/data/models/series_model.dart';
import '../../../../data/models/movies_model.dart';
import '../arch_banner_image.dart';

class SerieDetailHeader extends StatelessWidget {
  const SerieDetailHeader({super.key, required this.serie, required this.height});
  final SeriesModels serie;
  final double height;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          serie.name,
          style: const TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: ArcBannerImage("https://image.tmdb.org/t/p/w500${serie.posterPath}", height: 80),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  ("https://image.tmdb.org/t/p/w500${serie.backdropPath}"),
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(child: movieInformation),
            ],
          ),
        ),
      ],
    );
  }
}
