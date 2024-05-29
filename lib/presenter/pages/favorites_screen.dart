import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movie.dart';
import '../bloc/favorites/favorite_bloc.dart';
import '../bloc/favorites/favorite_state.dart';


class FavoritesScreen extends StatelessWidget {
  final List<Movie> movies = [];

  FavoritesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Movie'),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoritesLoadedState) {
            return ListView.builder(
              itemCount: state.favoriteMovieIds.length,
              itemBuilder: (context, index) {
                final movie = state.favoriteMovieIds[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                        height: 150,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          movie.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
