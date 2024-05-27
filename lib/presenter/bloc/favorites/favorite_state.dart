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
  final List<int> favoriteMovieIds;

  FavoritesLoadedState(this.favoriteMovieIds);
}

class FavoritesSeriesLoadedState extends FavoriteState{
  final List<int> favoriteSeriesIds;
  
  FavoritesSeriesLoadedState(this.favoriteSeriesIds);
}

class FavoriteErrorState extends FavoriteState {
  final String error;

  FavoriteErrorState(this.error);
}
