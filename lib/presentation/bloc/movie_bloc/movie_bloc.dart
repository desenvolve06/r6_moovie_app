import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/movie_repository_impl.dart';
import '../../../data/models/movies_model.dart';
import '../movie_event/movie_event.dart';
import '../movie_state/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(InitialState()) {
    final MoviesRepositoryImpl repository = MoviesRepositoryImpl();

    on<LoadingSuccessEvent>((event, emit) async {
      try {
        emit(LoadingState());
        print('<L> loading');
        final List<MoviesModels> movies = await repository.getPopularMovies();
        emit(LoadedSuccessState(movies: movies));
        print('<L> success');
      } on NetworkErrorEvent {
        emit(const ErrorState(
            error: "Failure to get movies. Is your device online?"));
      }
    });
  }
}
