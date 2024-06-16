import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/series.dart';
import '../../bloc/favorites/favorite_bloc.dart';
import '../../bloc/favorites/favorite_state.dart';
import 'favorite_toggle_button.dart';

class FavoriteBlocBuilder extends StatelessWidget {
  final dynamic media;

  const FavoriteBlocBuilder({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        bool isFavorite = false;
        if (state is FavoritesLoadedState) {
          if (media is Movie) {
            isFavorite =
                state.favoriteMovies.any((movie) => movie.id == media.id);
          } else if (media is Series) {
            isFavorite =
                state.favoriteSeries.any((series) => series.id == media.id);
          }
        }
        return FavoriteToggleButton(media: media, isFavorite: isFavorite);
      },
    );
  }
}
