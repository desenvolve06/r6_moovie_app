import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/data/repository/series_repository_impl.dart';
import 'package:r6_moovie_app/presentation/bloc/series/series_event.dart';
import 'package:r6_moovie_app/presentation/bloc/series/series_state.dart';
import '../../../data/models/series_model.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  SeriesBloc() : super(InitialSeriesState()) {
    final SeriesRepositoryImpl repository = SeriesRepositoryImpl();

    on<LoadingSeriesSuccessEvent>((event, emit) async {
      try {
        emit(LoadingSeriesState());
        final List<SeriesModels> series = await repository.getPopularSeries();
        emit(LoadedSeriesSuccessState(series));

      } on NetworkSeriesErrorEvent{
        emit(const ErrorSeriesState(
            error: "Failure to get Series. Is your device online?"));
      }
    });
  }
}
