import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../domain/entities/movie.dart';
import 'local_data_source.dart';

class LocalDataSourceImpl implements LocalDataSource {
  static const String _favoritesKey = 'favoritesKey';

  @override
  Future<void> addToFavorites(Movie movie) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Movie> favorites = await getFavorites();
    if (!favorites.any((movie) => movie.id == movie.id)) {
      favorites.add(movie);
      String jsonFavorites = jsonEncode(
          favorites.map((m) => m.toJson()).toList());
      await prefs.setString(_favoritesKey, jsonFavorites);
    }
  }

  @override
  Future<void> removeFromFavorites(Movie movie) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Movie> favorites = await getFavorites();
    favorites.removeWhere((movie) => movie.id == movie.id);
    String jsonFavorites = jsonEncode(
        favorites.map((movie) => movie.toJson()).toList());
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
}



