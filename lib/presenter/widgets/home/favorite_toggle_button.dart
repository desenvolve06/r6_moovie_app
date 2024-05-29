import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/movie.dart';
import '../../bloc/favorites/favorite_bloc.dart';
import '../../bloc/favorites/favorite_event.dart';
import '../../bloc/favorites/favorite_state.dart';

class FavoriteToggleButton extends StatelessWidget {
  final Movie movie;

  const FavoriteToggleButton({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBloc, FavoriteState>(
      listener: (context, state) {},
      builder: (context, state) {
        bool isFavorite = false;
        if (state is FavoritesLoadedState) {
          isFavorite = state.favoriteMovieIds.any((m) => m.id == movie.id);
        }
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            if (isFavorite) {
              context.read<FavoriteBloc>().add(RemoveFromFavoritesEvent(movie));
            } else {
              context.read<FavoriteBloc>().add(AddToFavoritesEvent(movie));
            }
          },
        );
      },
    );
  }
}