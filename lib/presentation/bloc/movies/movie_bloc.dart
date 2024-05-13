import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/movies_model.dart';
import '../../../data/repository/movie_repository_impl.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(InitialState()) {
    final MoviesRepositoryImpl repository = MoviesRepositoryImpl();

    on<LoadingSuccessEvent>((event, emit) async {
      try {
        emit(LoadingState());
        final List<MoviesModels> movies = await repository.getPopularMovies();
        emit(LoadedSuccessState(movies: movies));
      } on NetworkErrorEvent {
        emit(const ErrorState(
            error: "Failure to get movies. Is your device online?"));
      }
    });
  }
}
