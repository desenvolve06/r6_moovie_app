import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/movies.dart';
import '../../../domain/usecase/get_popular_movies_usecase.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  MovieBloc(this.getPopularMoviesUseCase) : super(InitialState()) {

    on<LoadingSuccessEvent>((event, emit) async {
      try {
        emit(LoadingState());
        final List<Movies> movies = await getPopularMoviesUseCase.invoke();
        emit(LoadedSuccessState(movies: movies));
      } on NetworkErrorEvent {
        emit(const ErrorState(
            error: "Failure to get movies. Is your device online?"));
      }
    });
  }
}
