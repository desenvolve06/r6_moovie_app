import 'package:r6_moovie_app/domain/entities/series.dart';

abstract class FavoriteEventSeries {}

class AddToFavoritesEventSeries extends FavoriteEventSeries {
  final Series series;

  AddToFavoritesEventSeries(this.series);
}

class RemoveFromFavoritesEventSeries extends FavoriteEventSeries {
  final Series seriesId;

  RemoveFromFavoritesEventSeries(this.seriesId);
}

class CheckIfFavoriteEventSeries extends FavoriteEventSeries {
  final int seriesId;

  CheckIfFavoriteEventSeries(this.seriesId);
}

class GetFavoritesEventSeries extends FavoriteEventSeries {}

class ToggleFavoriteEventSeries extends FavoriteEventSeries {
  final Series series;

  ToggleFavoriteEventSeries(this.series);
}
