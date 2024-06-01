import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie.dart';
import '../bloc/favorites/favorite_bloc.dart';
import '../bloc/favorites/favorite_state.dart';
import '../widgets/details/info_row.dart';
import '../widgets/details/media_detail_header.dart';
import '../widgets/details/overview.dart';
import '../widgets/details/text_list.dart';
import '../widgets/home/favorite_toggle_button.dart';
import 'favorites_screen.dart';

class MovieDetailsScreen extends StatelessWidget {
  final dynamic item;

  const MovieDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final Movie movie = item;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_sharp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          bool isFavorite = false;
          if (state is FavoritesLoadedState) {
            isFavorite = state.favoriteMovies.any((movie) => movie.id == movie.id);
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: MediaDetailHeader(
                    media: movie,
                    height: 250,
                    action: FavoriteToggleButton(media: movie),
                  ),
                ),
                InfoRow(
                    releaseDate: movie.releaseDate,
                    vote: movie.voteCount.toString(),
                    popularity:movie.popularity.toString()),
                const SizedBox(height: 10),
                const TextList(
                  items: ["About Movie", "Review", "Cast"],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: OverView(movie.overview),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
