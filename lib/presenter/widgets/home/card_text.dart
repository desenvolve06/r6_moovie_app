import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/series.dart';

class CardText extends StatelessWidget {
  final dynamic media;

  const CardText({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Text(
        media is Movie ? media.title.toString() : (media as Series).name.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
