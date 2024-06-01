import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/series.dart';
import '../bloc/favorites/favorite_bloc.dart';
import '../bloc/favorites/favorite_event.dart'; // Importando eventos
import '../bloc/favorites/favorite_state.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(GetFavoritesEvent());
  }

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
              itemCount:
                  state.favoriteMovies.length + state.favoriteSeries.length,
              itemBuilder: (context, index) {
                if (index < state.favoriteMovies.length) {
                  final movie = state.favoriteMovies[index];
                  return _buildMovieCard(movie);
                } else {
                  final seriesIndex = index - state.favoriteMovies.length;
                  final series = state.favoriteSeries[seriesIndex];
                  return _buildSeriesCard(series);
                }
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

  Widget _buildMovieCard(Movie movie) {
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
  }

  Widget _buildSeriesCard(Series series) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500${series.backdropPath}',
            height: 150,
            width: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              series.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}