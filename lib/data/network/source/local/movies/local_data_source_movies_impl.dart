import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../domain/entities/movie.dart';
import 'local_data_source_movies.dart';

class LocalDataSourceMoviesImpl implements LocalDataSourceMovies {
  static const String _favoritesKey = 'favoritesKey';
  static const String _moviesKey = 'moviesKey';
  final Logger logger = Logger();

  @override
  Future<List<Movie>> getPopularMovies() async {
    final prefs = await SharedPreferences.getInstance();
    final String? moviesJson = prefs.getString(_moviesKey);

    if (moviesJson != null) {
      final List<dynamic> movieList = jsonDecode(moviesJson);
      logger.i('Movies retrieved from local data source: ${movieList.length}');
      return movieList.map((json) => Movie.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> addToFavorites(Movie movie) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Movie> favorites = await getFavorites();
    if (!favorites.any((favoriteMovie) => favoriteMovie.id == movie.id)) {
      favorites.add(movie);
      final String jsonFavorites =
          jsonEncode(favorites.map((m) => m.toJson()).toList());
      await prefs.setString(_favoritesKey, jsonFavorites);
    }
  }

  @override
  Future<void> removeFromFavorites(Movie movie) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Movie> favorites = await getFavorites();
    favorites.removeWhere((favoriteMovie) => favoriteMovie.id == movie.id);
    String jsonFavorites =
        jsonEncode(favorites.map((movie) => movie.toJson()).toList());
    await prefs.setString(_favoritesKey, jsonFavorites);
  }

  @override
  Future<bool> isFavorite(int id) async {
    List<Movie> favorites = await getFavorites();
    return favorites.any((movie) => movie.id == movie.id);
  }

  @override
  Future<List<Movie>> getFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonFavorites = prefs.getString(_favoritesKey);
    if (jsonFavorites != null) {
      List<dynamic> decoded = jsonDecode(jsonFavorites);
      return decoded.map((json) => Movie.fromJson(json)).toList();
    }
    return [];
  }

  @override
  Future<void> saveMovies(List<Movie> movies) async {
    try {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> movieJsonList =
        movies.map((movie) => movie.toJson()).toList();
    final String moviesJson = jsonEncode(movieJsonList);
    await prefs.setString(_moviesKey, moviesJson);
    logger.i('Movies data source saved locally: ${movieJsonList.length}');
    logger.i('Movies saved source saved locally: $movieJsonList');
  } catch (e) {
  logger.e('Failed to save movies to local data source: $e');
  }
}
}