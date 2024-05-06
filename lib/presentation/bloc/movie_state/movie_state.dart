import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/movies_model.dart';

@immutable
abstract class MovieState extends Equatable {
  const MovieState();
  @override
  List<Object> get props => [];
}

//eventos que sairão do bloc

class EmptyState extends MovieState {}
class InitialState extends MovieState {}
class LoadingState extends MovieState {}

class LoadedSuccessState extends MovieState {
  final List<MoviesModels> movies;
  const LoadedSuccessState({required this.movies});
}

class ErrorState extends MovieState {
  final String? error;
  const ErrorState({required this.error});
}