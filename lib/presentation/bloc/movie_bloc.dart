import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/api_repository.dart';

import '../../models/movies_model.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(): super(InitialState()) {
    final ApiRepository repository = ApiRepository();

    on<GetMovieList>((event, emit) async {
      try {
        emit(LoadingState());
        final List<MoviesModels> movies = await repository.fetchMovies();
        emit(LoadedSuccessState(movies: movies));
      } on NetworkErrorEvent{
         emit(const ErrorState(error: "Failure to get movies. Is your device online?"));
      }
    });
  }
}

// final MoviesRepository repository;

// MovieBloc(super.initialState, {required this.repository});

// MovieState get initialState => const LoadingState();

// @override
// Stream<MovieState> mapEventToState(MovieEvent event,) async* {
//   // Emitting a state from the asynchronous generator
//   // Branching the executed logic by checking the event type
//   LoadingState();
//   if (event is LoadingSucessEvent) {
//     yield* _mapMoviesLoadedToState();
//   }
// }

// Stream<MovieState> _mapMoviesLoadedToState() async* {
//   try {
//     var movies = (await repository.getPopularMovies());
//     yield movies.fold(
//           (failure) => ErrorState("error loading Movies"),
//           (movies) => LoadedSuccessState(),
//     );
//   } catch (error) {
//     yield ErrorState("error loading Albums$error");
//   }
// try {
//   var movies = (await repository.getPopularMovies());
//   yield movies.fold(
//         (failure) => const ErrorState("error loading Albums"),
//         (movies) => LoadedSucessState(movies),
//   );
// } catch (error) {
//   yield ErrorState("error loading Albums$error");
// }
//   }
// }
