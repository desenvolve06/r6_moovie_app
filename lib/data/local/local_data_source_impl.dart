import 'dart:convert';
import 'package:r6_moovie_app/data/local/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceImpl implements LocalDataSource {
  static const String _favouritesKey = 'favouriteKey';
  late Set<int> favoriteMovieIds;

  @override
  Future<void> addToFavorites(int movieId) async {
    List<int> favorites = await getFavourites();
    favorites.add(movieId);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonFavorites = jsonEncode(favorites);
    await prefs.setString(_favouritesKey, jsonFavorites);
  }

  @override
  Future<void> removeFromFavorites(int movieId) async {
    List<int> favorites = await getFavourites();
    favorites.remove(movieId);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonFavorites = jsonEncode(favorites);
    await prefs.setString(_favouritesKey, jsonFavorites);
  }

  @override
  Future<bool> isFavourite(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> favorites = prefs.getStringList(_favouritesKey)?.toSet() ?? {};
    return favorites.contains(id.toString());
  }

  @override
  Future<List<int>> getFavourites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList(_favouritesKey);
    return favorites?.map((id) => int.parse(id)).toList() ?? [];
  }
}
