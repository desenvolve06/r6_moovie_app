import '../../../domain/entities/movie.dart';

abstract class FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteAddedState extends FavoriteState {}

class FavoriteRemovedState extends FavoriteState {}

class FavoriteCheckState extends FavoriteState {
  final bool isFavorite;

  FavoriteCheckState(this.isFavorite);
}

class FavoritesLoadedState extends FavoriteState {
  final List<Movie> favoriteMovieIds;

  FavoritesLoadedState(this.favoriteMovieIds);
}

class FavoriteErrorState extends FavoriteState {
  final String error;

  FavoriteErrorState(this.error);
}
