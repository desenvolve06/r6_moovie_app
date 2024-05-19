import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/presentation/bloc/movies/movie_event.dart';
import '../../domain/usecase/get_popular_movies_usecase.dart';
import '../bloc/movies/movie_state.dart';

class MoviesViewModel extends Bloc<MovieEvent, MovieState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  MoviesViewModel({required this.getPopularMoviesUseCase})
      : super(InitialState()) {
    on<LoadingSuccessEvent>(_onLoadingSuccessEvent);
  }
  Future<void> _onLoadingSuccessEvent(LoadingSuccessEvent event, Emitter<MovieState> emit) async {
    emit(LoadingState());
    try {
      final movies = await getPopularMoviesUseCase.invoke();
      emit(LoadedSuccessState(movies: movies));
    } on NetworkErrorEvent {
      emit(const ErrorState(error: "Failure to get movies. Is your device online?"));
    }
  }
}




