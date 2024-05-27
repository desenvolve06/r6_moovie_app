import 'package:flutter/material.dart';
import 'package:r6_moovie_app/resources/app_values.dart';

import '../../../../domain/entities/movie.dart';
import '../../../../domain/entities/series.dart';
import 'arch_banner_image.dart';

class MediaDetailHeader<T> extends StatelessWidget {
  const MediaDetailHeader({
    super.key,
    required this.media,
    required this.height,
  });

  final T media;
  final double height;

  @override
  Widget build(BuildContext context) {
    final title =
        media is Movie ? (media as Movie).title : (media as Series).name;
    final backdropPath = media is Movie
        ? (media as Movie).backdropPath
        : (media as Series).backdropPath;

    var backdropPathItem = "https://image.tmdb.org/t/p/w500$backdropPath";

    final mediaInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSize.s20,
          ),
        ),
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: ArcBannerImage(backdropPathItem, height: 80),
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
                  backdropPathItem,
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(child: mediaInformation),
            ],
          ),
        ),
      ],
    );
  }
}
