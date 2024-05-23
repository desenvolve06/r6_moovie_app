import 'dart:convert';
import 'package:r6_moovie_app/data/local/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceImpl implements LocalDataSource {
  static const String _favouritesKey = 'favouriteKey';
  late Set<int> favoriteMovieIds;

  // Future<Map<String, dynamic>?> get(String key)
  // Future<List<int>> getFavourites() async {
  //   // final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // favoriteMovieIds = prefs.getKeys().map((key) => int.parse(key)).toSet();
  // }

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
    Set<String> favorites = prefs.getStringList(_favouritesKey)?.toSet() ?? {};
    return favorites.map((id) => int.parse(id)).toList();
  }





//   List<int> getFavouritesList() {
//     final stringList = _sharedPreferences.getStringList(_listKey) ?? [];
//     return stringList.map(int.parse).toList();
//   }
//
//   Future<bool> saveToFavouritesList(int id) async {
//     final favourites = getFavouritesList();
//     if (!favourites.contains(id)) {
//       favourites.add(id);
//       return await _updateFavourites(favourites);
//     }
//     return false;
//   }
//
//   bool isFavourite(int id) {
//     return getFavouritesList().contains(id);
//   }
//
//   Future<bool> removeFromFavourites(int id) async {
//     final favourites = getFavouritesList();
//     if (favourites.remove(id)) {
//       return await _updateFavourites(favourites);
//     }
//     return false;
//   }
//
//   Future<bool> _updateFavourites(List<int> favourites) async {
//     final stringList = favourites.map((id) => id.toString()).toList();
//     return await _sharedPreferences.setStringList(_listKey, stringList);
//   }
}