import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecase/movies/get_popular_movie_use_case.dart';
import '../../../domain/usecase/movies/save_movies_use_case.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final Logger logger = Logger();
  final SaveMoviesUseCase saveMoviesUseCase;
  MovieBloc(this.getPopularMoviesUseCase, this.saveMoviesUseCase) : super(InitialState()) {
    on<LoadingSuccessEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final List<Movie> movies = await getPopularMoviesUseCase.invoke();
        await saveMoviesUseCase.invoke(movies.toList());
        logger.i('bloc: ${movies.length}');
        logger.i('bloc: ${movies.toList()}');
        emit(LoadedSuccessState(movies: movies));
      } catch (e) {
        emit(const ErrorState(
            error: "Failure to get movies. Is your device online?"));
      }
    });
  }
}
