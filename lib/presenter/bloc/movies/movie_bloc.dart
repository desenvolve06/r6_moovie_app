import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecase/movies/get_popular_movie_use_case.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  MovieBloc(this. getPopularMoviesUseCase) : super(InitialState()) {

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
