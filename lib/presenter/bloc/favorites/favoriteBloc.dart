import 'package:bloc/bloc.dart';

import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState(false));

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    yield FavoriteState(event.isFavorite);
  }
}