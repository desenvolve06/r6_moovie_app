import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/domain/usecase/remove_favorite_movie.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecase/get_favorite_list_movies.dart';
import '../../../domain/usecase/get_popular_movie_use_case.dart';
import '../../../domain/usecase/is_favorite_movie.dart';
import '../../../domain/usecase/save_favorite_movie.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetFavoriteListMovies getFavoriteListMovies;
  final IsFavoriteMovie isFavoriteMovie;
  final SaveFavoriteMovie saveFavoriteMovie;
  final RemoveFavoriteMovie removedFavoriteMovie;

  MovieBloc(this.getPopularMoviesUseCase, this.getFavoriteListMovies,
      this.isFavoriteMovie, this.saveFavoriteMovie, this.removedFavoriteMovie) : super(InitialState()) {
    on<LoadingSuccessEvent>((event, emit) async {
      try {
        emit(LoadingState());
        final List<Movie> movies = await getPopularMoviesUseCase.invoke();
        emit(LoadedSuccessState(movies: movies));
      } on NetworkErrorEvent {
        emit(const ErrorState(
            error: "Failure to get movies. Is your device online?"));
      }
    });
  }
}
