import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../domain/entities/movies.dart';
@immutable
abstract class MovieState extends Equatable {
  const MovieState();
  @override
  List<Object> get props => [];
}

class InitialState extends MovieState {}

class LoadingState extends MovieState {}

class LoadedSuccessState extends MovieState {

  final List<Movies>? movies;

  const LoadedSuccessState({this.movies});
}

class ErrorState extends MovieState {
  final String? error;
  const ErrorState({required this.error});
}
