import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/movie.dart';

@immutable
abstract class MovieEvent extends Equatable {
  const MovieEvent();
  @override
  List<Object> get props => [];
}

class LoadingSuccessEvent extends MovieEvent {}

class NetworkErrorEvent extends Error {}

class ToggleFavoriteEvent extends MovieEvent {
  final Movie movie;

  const ToggleFavoriteEvent(this.movie);

  @override
  List<Object> get props => [];
}
class LoadPopularMovies extends MovieEvent {}