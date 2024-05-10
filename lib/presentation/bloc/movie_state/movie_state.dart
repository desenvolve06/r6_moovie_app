import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:r6_moovie_app/data/models/series_model.dart';
import '../../../data/models/movies_model.dart';

@immutable
abstract class MovieState extends Equatable {
  const MovieState();
  @override
  List<Object> get props => [];
}

class InitialState extends MovieState {}

class LoadingState extends MovieState {}

class LoadedSuccessState extends MovieState {
  final List<SeriesModels>? series;
  final List<MoviesModels>? movies;

  const LoadedSuccessState({this.movies, this.series});
}

class ErrorState extends MovieState {
  final String? error;
  const ErrorState({required this.error});
}
