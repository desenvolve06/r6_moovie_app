import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/data/repository/series_repository_impl.dart';

import '../../../models/series_model.dart';
import '../movie_event/movie_event.dart';
import '../movie_state/movie_state.dart';

class SerieBloc extends Bloc<MovieEvent, MovieState> {
  SerieBloc() : super(InitialState()) {
    final SeriesRepositoryImpl repository = SeriesRepositoryImpl();

    on<LoadingSuccessEvent>((event, emit) async {
      try {
        emit(LoadingState());
        print('<L> loading');
        final List<SeriesModels> series = await repository.getPopularSeries();
        print("SERIES $series");
        emit(LoadedSuccessState(series: series));
        print('<L> success');
      } on NetworkErrorEvent {
        emit(const ErrorState(
            error: "Failure to get Series. Is your device online?"));
      }
    });
  }
}
