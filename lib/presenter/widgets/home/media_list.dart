import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/series.dart';
import 'card_image_text.dart';

class MediaList extends StatelessWidget {
  final List<dynamic>? mediaList;
  final List<Movie> movies;
  final List<Series> series;
  final String title;

  const MediaList({
    super.key,
    required this.mediaList,
    required this.title,
    required this.movies,
    required this.series,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mediaList?.length ?? 0,
            itemBuilder: (context, index) {
              final media = mediaList![index];
              return CardImageText(media: media);
            },
          ),
        ),
      ],
    );
  }
}
