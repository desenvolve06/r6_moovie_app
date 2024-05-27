import '../../../domain/entities/movie.dart';

abstract class FavoriteEvent {}

class AddToFavoritesEvent extends FavoriteEvent {
  final Movie movie;

  AddToFavoritesEvent(this.movie);
}

class RemoveFromFavoritesEvent extends FavoriteEvent {
  final Movie movieId;

  RemoveFromFavoritesEvent(this.movieId);
}

class CheckIfFavoriteEvent extends FavoriteEvent {
  final int movieId;

  CheckIfFavoriteEvent(this.movieId);
}

class GetFavoritesEvent extends FavoriteEvent {}

class ToggleFavoriteEvent extends FavoriteEvent {
  final Movie movie;

  ToggleFavoriteEvent(this.movie);
}
