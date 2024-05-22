import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class MovieEvent extends Equatable {
  const MovieEvent();
  @override
  List<Object> get props => [];
}

class LoadingSuccessEvent extends MovieEvent {}

class NetworkErrorEvent extends Error {}

class ToggleFavoriteEvent extends MovieEvent {
  final int movieId;

  const ToggleFavoriteEvent(this.movieId);

  @override
  List<Object> get props => [];
}