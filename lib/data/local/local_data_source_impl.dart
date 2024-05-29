import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/movie.dart';
import '../local/local_data_source.dart';

class LocalDataSourceImpl implements LocalDataSource {
  static const String _favoritesKey = 'favoritesKey';

  @override
  Future<void> addToFavorites(Movie movie) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<Movie> favorites = await getFavorites();
      if (!favorites.any((m) => m.id == movie.id)) {
        favorites.add(movie);
        String jsonFavorites = jsonEncode(
            favorites.map((m) => m.toJson()).toList());
        await prefs.setString(_favoritesKey, jsonFavorites);
      }
    } catch (e) {
      print('Erro ao adicionar aos favoritos: $e');
      rethrow; // Re-throwing the exception might be useful to handle it further up the call stack if needed
    }
  }

  @override
  Future<void> removeFromFavorites(Movie movie) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<Movie> favorites = await getFavorites();
      favorites.removeWhere((m) => m.id == movie.id);
      String jsonFavorites = jsonEncode(
          favorites.map((m) => m.toJson()).toList());
      await prefs.setString(_favoritesKey, jsonFavorites);
    } catch (e) {
      print('Erro ao remover dos favoritos: $e');
      rethrow;
    }
  }

  @override
  Future<bool> isFavorite(int id) async {
    try {
      List<Movie> favorites = await getFavorites();
      return favorites.any((movie) => movie.id == id);
    } catch (e) {
      print('Erro ao verificar se é favorito: $e');
      return false; // Returning false in case of an error
    }
  }

  @override
  Future<List<Movie>> getFavorites() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonFavorites = prefs.getString(_favoritesKey);
      if (jsonFavorites != null) {
        List<dynamic> decoded = jsonDecode(jsonFavorites);
        return decoded.map((json) => Movie.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      print('Erro ao obter os favoritos: $e');
      return [];
    }
  }
}
