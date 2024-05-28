import 'package:r6_moovie_app/domain/entities/series.dart';


abstract class FavoriteStateSeries{}

class FavoriteInitialState extends FavoriteStateSeries {}

class FavoriteLoadingState extends FavoriteStateSeries {}

class FavoriteAddedState extends FavoriteStateSeries {}

class FavoriteRemovedState extends FavoriteStateSeries {}

class FavoriteCheckState extends FavoriteStateSeries {
  final bool isFavorite;

  FavoriteCheckState(this.isFavorite);
}

class FavoritesLoadedStateSeries extends FavoriteStateSeries {
  final List<Series> favoriteSeriesIds;

  FavoritesLoadedStateSeries(this.favoriteSeriesIds);
}

class FavoriteErrorState extends FavoriteStateSeries {
  final String error;

  FavoriteErrorState(this.error);
}
