import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../domain/entities/movie.dart';

@immutable
abstract class MovieState extends Equatable {
  const MovieState();
  @override
  List<Object> get props => [];
}

class InitialState extends MovieState {}

class LoadingState extends MovieState {}

class LoadedSuccessState extends MovieState {
  final List<Movie> movies;

  const LoadedSuccessState({required this.movies});

  @override
  List<Object> get props => [movies];
}

class ErrorState extends MovieState {
  final String? error;
  const ErrorState({required this.error});
}

class FavoriteListUpdatedState extends MovieState {
  final List<int> favoriteList;

  const FavoriteListUpdatedState({required this.favoriteList});

  @override
  List<Object> get props => [favoriteList];
}
