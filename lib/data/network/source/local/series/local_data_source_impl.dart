import 'dart:convert';
  import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../domain/entities/series.dart';
import 'local_data_source_series.dart';

  class LocalDataSourceSeriesImpl implements LocalDataSourceSeries {
    static const String _favoritesSeriesKey = 'favoritesSeriesKey';

    @override
    Future<void> addToFavorites(Series series) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<Series> favorites = await getFavorites();
      if (!favorites.any((series) => series.id == series.id)) {
        favorites.add(series);
        String jsonFavorites = jsonEncode(
            favorites.map((series) => series.toJson()).toList());
        await prefs.setString(_favoritesSeriesKey, jsonFavorites);
      }
    }

    @override
    Future<void> removeFromFavorites(Series series) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<Series> favorites = await getFavorites();
      favorites.removeWhere((series) => series.id == series.id);
      String jsonFavorites = jsonEncode(
          favorites.map((series) => series.toJson()).toList());
      await prefs.setString(_favoritesSeriesKey, jsonFavorites);
    }

    @override
    Future<bool> isFavorite(int id) async {
      List<Series> favorites = await getFavorites();
      return favorites.any((series) => series.id ==series.id);
    }

    @override
    Future<List<Series>> getFavorites() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonFavorites = prefs.getString(_favoritesSeriesKey);
      if (jsonFavorites != null) {
        List<dynamic> decoded = jsonDecode(jsonFavorites);
        return decoded.map((json) => Series.fromJson(json)).toList();
      }
      return [];
    }
  }