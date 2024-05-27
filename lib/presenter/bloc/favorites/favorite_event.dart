abstract class FavoriteEvent {}

class AddToFavoritesEvent extends FavoriteEvent {
  final int movieId;

  AddToFavoritesEvent(this.movieId);
}

class RemoveFromFavoritesEvent extends FavoriteEvent {
  final int movieId;

  RemoveFromFavoritesEvent(this.movieId);
}

class CheckIfFavoriteEvent extends FavoriteEvent {
  final int movieId;

  CheckIfFavoriteEvent(this.movieId);
}

class GetFavoritesEvent extends FavoriteEvent {}

class ToggleFavorite extends FavoriteEvent {
  final int movieId;
  ToggleFavorite(this.movieId);
}


// Eventos 
// para 
// séries

class AddSeriesToFavoritesEvent extends FavoriteEvent {
  final int serieId;

  AddSeriesToFavoritesEvent(this.serieId);
}

class RemoveSeriesFromFavoritesEvent extends FavoriteEvent {
  final int serieId;

  RemoveSeriesFromFavoritesEvent(this.serieId);
}

class CheckSeriesIfFavoriteEvent extends FavoriteEvent {
  final int serieId;

  CheckSeriesIfFavoriteEvent(this.serieId);
}

class GetSeriesFavoritesEvent extends FavoriteEvent {}

class ToggleSeriesFavorite extends FavoriteEvent {
  final int serieId;
  ToggleSeriesFavorite(this.serieId);
}
