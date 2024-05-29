import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class AddToFavoritesEvent extends FavoriteEvent {
  final dynamic media;

  const AddToFavoritesEvent(this.media);

  @override
  List<Object> get props => [media];
}

class RemoveFromFavoritesEvent extends FavoriteEvent {
  final dynamic media;

  const RemoveFromFavoritesEvent(this.media);

  @override
  List<Object> get props => [media];
}

class CheckIfFavoriteEvent extends FavoriteEvent {
  final dynamic media;

  const CheckIfFavoriteEvent(this.media);

  @override
  List<Object> get props => [media];
}

class GetFavoritesEvent extends FavoriteEvent {}

class ToggleFavoriteEvent extends FavoriteEvent {
  final dynamic media;

  const ToggleFavoriteEvent(this.media);

  @override
  List<Object> get props => [media];
}
