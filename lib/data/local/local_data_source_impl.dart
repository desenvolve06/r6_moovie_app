import 'dart:convert';
import 'package:r6_moovie_app/data/local/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceImpl implements LocalDataSource {
  static const String _favouritesKey = 'favouriteKey';
  late Set<int> favoriteMovieIds;

  @override
  Future<void> addToFavorites(int movieId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<int> favorites = await getFavourites();
    if (!favorites.contains(movieId)) {
      favorites.add(movieId);
      String jsonFavorites = jsonEncode(favorites);
      await prefs.setString(_favouritesKey, jsonFavorites);
      print('adicionou no favorito $movieId');
    }
  }

  @override
  Future<void> removeFromFavorites(int movieId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<int> favorites = await getFavourites();
    favorites.remove(movieId);
    String jsonFavorites = jsonEncode(favorites);
    await prefs.setString(_favouritesKey, jsonFavorites);
  }

  @override
  Future<bool> isFavourite(int id) async {
    List<int> favorites = await getFavourites();
    print('è favorito $id');
    return favorites.contains(id);

  }

  @override
  Future<List<int>> getFavourites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonFavorites = prefs.getString(_favouritesKey);
    if (jsonFavorites != null) {
      List<int> favoriteIds = List<int>.from(jsonDecode(jsonFavorites));
      return favoriteIds;
    }
    return [];
  }
}
