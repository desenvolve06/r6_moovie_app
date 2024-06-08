import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                child: BlocBuilder<FavoriteBloc, FavoriteState>(
                  builder: (context, state) {
                    bool isFavorite = false;
                    if (state is FavoritesLoadedState) {
                      if (media is Movie) {
                        isFavorite = state.favoriteMovies.any((movie) => movie.id == media.id);
                      } else if (media is Series) {
                        isFavorite = state.favoriteSeries.any((series) => series.id == media.id);
                      }
                    }
                    return FavoriteToggleButton(media: media, isFavorite: isFavorite);
                  },
                ),
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