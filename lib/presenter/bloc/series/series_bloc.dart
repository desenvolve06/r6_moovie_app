import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/series/series_event.dart';
import 'package:r6_moovie_app/presenter/bloc/series/series_state.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';
import '../../../domain/entities/series.dart';
import '../../../domain/usecase/get_popular_series_use_case.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  final GetPopularSeriesUseCase getPopularSeriesUseCase;
  SeriesBloc(this.getPopularSeriesUseCase) : super(InitialSeriesState()) {

    on<LoadingSeriesSuccessEvent>((event, emit) async {
      try {
        emit(LoadingSeriesState());
        final List<Series> series = await getPopularSeriesUseCase.invoke();
        emit(LoadedSeriesSuccessState(series));

      } on NetworkSeriesErrorEvent{
        emit(const ErrorSeriesState(
            error: AppStrings.errorMessage));
      }
    });
  }
}
