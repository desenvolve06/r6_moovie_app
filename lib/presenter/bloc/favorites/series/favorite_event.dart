import 'package:r6_moovie_app/domain/entities/series.dart';


abstract class FavoriteEvent {}

class AddToFavoritesEvent extends FavoriteEvent {
  final Series series;

  AddToFavoritesEvent(this.series);
}

class RemoveFromFavoritesEvent extends FavoriteEvent {
  final Series seriesId;

  RemoveFromFavoritesEvent(this.seriesId);
}

class CheckIfFavoriteEvent extends FavoriteEvent {
  final int seriesId;

  CheckIfFavoriteEvent(this.seriesId);
}

class GetFavoritesEvent extends FavoriteEvent {}

class ToggleFavoriteEvent extends FavoriteEvent {
  final Series series;

  ToggleFavoriteEvent(this.series);
}
