import 'package:r6_moovie_app/domain/entities/series.dart';


abstract class FavoriteStateSeries{}

class FavoriteInitialStateSeries extends FavoriteStateSeries {}

class FavoriteLoadingStateSeries extends FavoriteStateSeries {}

class FavoriteAddedStateSeries extends FavoriteStateSeries {}

class FavoriteRemovedStateSeries extends FavoriteStateSeries {}

class FavoriteCheckStateSeries extends FavoriteStateSeries {
  final bool isFavorite;

  FavoriteCheckStateSeries(this.isFavorite);
}

class FavoritesLoadedStateSeries extends FavoriteStateSeries {
  final List<Series> favoriteSeriesIds;

  FavoritesLoadedStateSeries(this.favoriteSeriesIds);
}

class FavoriteErrorStateSeries extends FavoriteStateSeries {
  final String error;

  FavoriteErrorStateSeries(this.error);
}
