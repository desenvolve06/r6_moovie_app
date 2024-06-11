import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';
import '../../bloc/favorites/favorite_bloc.dart';
import '../../bloc/favorites/favorite_event.dart';
import '../../bloc/favorites/favorite_state.dart';

class FavoriteToggleButton extends StatelessWidget {
  final dynamic media;
  final bool isFavorite;

  const FavoriteToggleButton({
    super.key,
    required this.media,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBloc, FavoriteState>(
      listener: (context, state) {
        if (state is FavoriteErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(AppStrings.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            if (isFavorite) {
              context.read<FavoriteBloc>().add(RemoveFromFavoritesEvent(media));
            } else {
              context.read<FavoriteBloc>().add(AddToFavoritesEvent(media));
            }
          },
        );
      },
    );
  }
}
