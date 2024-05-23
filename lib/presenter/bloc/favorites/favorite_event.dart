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
