import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  // final SharedPreferences _sharedPreferences;
  // static const String _listKey = 'favourites';

  // LocalDataSource(this._sharedPreferences);

  // List<int> getFavouritesList() {
  //   final stringList = _sharedPreferences.getStringList(_listKey) ?? [];
  //   return stringList.map(int.parse).toList();
  // }
  //
  // Future<bool> saveToFavouritesList(int id) async {
  //   final favourites = getFavouritesList();
  //   if (!favourites.contains(id)) {
  //     favourites.add(id);
  //     return await _updateFavourites(favourites);
  //   }
  //   return false;
  // }
  //
  // bool isFavourite(int id) {
  //   return getFavouritesList().contains(id);
  // }
  //
  // Future<bool> removeFromFavourites(int id) async {
  //   final favourites = getFavouritesList();
  //   if (favourites.remove(id)) {
  //     return await _updateFavourites(favourites);
  //   }
  //   return false;
  // }
  //
  // Future<bool> _updateFavourites(List<int> favourites) async {
  //   final stringList = favourites.map((id) => id.toString()).toList();
  //   return await _sharedPreferences.setStringList(_listKey, stringList);
  // }
}