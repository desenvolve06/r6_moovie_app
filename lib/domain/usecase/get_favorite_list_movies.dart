import 'package:r6_moovie_app/domain/repository/movie_repository.dart';

class GetFavoriteListMovies {
  final MoviesRepository moviesRepository;

  GetFavoriteListMovies(this.moviesRepository);

  List<int> invoke() {
    return moviesRepository.getFavoritesMovies();
  }
}