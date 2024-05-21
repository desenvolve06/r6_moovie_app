import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../domain/entities/series.dart';

@immutable
abstract class SeriesState extends Equatable {
  const SeriesState();
  @override
  List<Object> get props => [];
}

class InitialSeriesState extends SeriesState {}

class LoadingSeriesState extends SeriesState {}

class LoadedSeriesSuccessState extends SeriesState {
  final List<Series>? series;

  const LoadedSeriesSuccessState(this.series);

}

class ErrorSeriesState extends SeriesState {
  final String? error;
  const ErrorSeriesState({required this.error});
}
