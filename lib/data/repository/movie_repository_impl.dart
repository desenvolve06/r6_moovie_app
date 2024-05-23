import 'dart:convert';

import '../../domain/entities/movie.dart';
import '../../domain/repository/movie_repository.dart';
import '../local/local_data_source.dart';
import '../source/movie_data_source.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MovieDataSource moviesDataSource;
  final LocalDataSource localDataSource;

  MoviesRepositoryImpl(this.moviesDataSource, this.localDataSource);

  @override
  Future<List<Movie>> getPopularMovies() => moviesDataSource.getPopularMovies();

  @override
  Future<void> addToFavorites(int id) async {
  await localDataSource.addToFavorites(id);
  }

  @override
  Future<List<int>> getFavourites() async {
   return await localDataSource.getFavourites();
  }

  @override
  Future<bool> isFavourite(int id) {
    // TODO: implement isFavourite
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromFavorites(int id) async {
    localDataSource.removeFromFavorites(id);
  }


  // @override
  // List<int> getFavoritesMovies() => localDataSource.getFavouritesList();
  //
  // @override
  // Future<bool> removeFromFavourite(int id) => localDataSource.removeFromFavourites(id);
  //
  // @override
  // bool checkIsFavoriteMovie(int id) => localDataSource.isFavourite(id);
  //
  // @override
  // Future<bool> saveToFavourites(int id) => localDataSource.saveToFavouritesList(id);
}

