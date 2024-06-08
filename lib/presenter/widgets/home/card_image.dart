import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class CardImage extends StatelessWidget {
  final dynamic media;

  const CardImage({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: CachedNetworkImage(
          imageUrl:  'https://image.tmdb.org/t/p/w500${media.backdropPath}',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}