import '../repository/movie_repository.dart';

class IsFavoriteMovie {
  final MoviesRepository moviesRepository;

  IsFavoriteMovie(this.moviesRepository);

  bool invoke(int id) {return moviesRepository.checkIsFavoriteMovie(id);}
}
