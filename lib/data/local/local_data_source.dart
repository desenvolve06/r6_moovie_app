abstract class LocalDataSource {
  /// Este método deve retornar uma lista de IDs que representam os itens favoritos.*

      Future<List<int>> getFavourites();

///Este método deve salvar um ID na lista de favoritos e retornar um Future<bool> indicando se a operação foi bem-sucedida.
      Future<void> addToFavorites(int id);

      ///Este método deve verificar se um determinado ID está na lista de favoritos e retornar um bool
      Future<bool> isFavourite(int id);

      /// Este método deve remover um ID da lista de favoritos e retornar um Future<bool> indicando se a operação foi bem-sucedida.
      Future<void> removeFromFavorites(int id);
 }
