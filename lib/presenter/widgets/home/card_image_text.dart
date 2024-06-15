import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/presenter/widgets/home/favorite_bloc_builder.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/series.dart';
import '../../bloc/favorites/favorite_bloc.dart';
import '../../bloc/favorites/favorite_state.dart';
import '../../pages/movies_details_screen.dart';
import '../../pages/series_details_screen.dart';
import 'card_image.dart';
import 'card_text.dart';
import 'favorite_toggle_button.dart';

class CardImageText extends StatelessWidget {
  final dynamic media;

  const CardImageText({super.key, required this.media});

  void _navigateToDetails(BuildContext context) {
    if (media is Movie) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailsScreen(item: media),
        ),
      );
    } else if (media is Series) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SeriesDetailsScreen(item: media),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetails(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 155,
          width: 120,
          child: Stack(
            children: [
              CardImage(media: media),
              Positioned(
                top: 8,
                right: 8,
                child: FavoriteBlocBuilder(media: media),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CardText(media: media),
              ),
            ],
          ),
        ),
      ),
    );
  }
}