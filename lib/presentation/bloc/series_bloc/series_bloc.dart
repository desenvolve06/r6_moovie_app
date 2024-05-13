import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/data/repository/series_repository_impl.dart';
import 'package:r6_moovie_app/presentation/bloc/movie_event/series_event.dart';
import 'package:r6_moovie_app/presentation/bloc/movie_state/series_state.dart';

import '../../../data/models/series_model.dart';
import '../movie_event/movie_event.dart';
import '../movie_state/movie_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  SeriesBloc() : super(InitialSeriesState()) {
    final SeriesRepositoryImpl repository = SeriesRepositoryImpl();

    on<LoadingSeriesSuccessEvent>((event, emit) async {
      try {
        emit(LoadingSeriesState());
        print('<L> loading seies');
        final List<SeriesModels> series = await repository.getPopularSeries();
        print("SERIES $series");
        emit(LoadedSeriesSuccessState(series));
        print('<L> success seiries');
      } on NetworkSeriesErrorEvent{
        emit(const ErrorSeriesState(
            error: "Failure to get Series. Is your device online?"));
      }
    });
  }
}
