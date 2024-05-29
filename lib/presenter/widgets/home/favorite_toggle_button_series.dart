import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/domain/entities/series.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/series/favorite_event_series.dart';
import '../../bloc/favorites/series/favorite_bloc_series.dart';
import '../../bloc/favorites/series/favorite_state_series.dart';

class FavoriteToggleButtonSeries extends StatelessWidget {
  final Series series;

  const FavoriteToggleButtonSeries({Key? key, required this.series}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBlocSeries, FavoriteStateSeries>(
      listener: (context, state) {},
      builder: (context, state) {
        bool isFavorite = false;
        if (state is FavoritesLoadedStateSeries) {
          isFavorite = state.favoriteSeriesIds.any((series) => series.id == series.id);
        }
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            if (isFavorite) {
              context.read<FavoriteBlocSeries>().add(RemoveFromFavoritesEventSeries(series));
            } else {
              context.read<FavoriteBlocSeries>().add(AddToFavoritesEventSeries(series));
            }
          },
        );
      },
    );
  }
}