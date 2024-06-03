import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/presenter/widgets/home/favorite_toggle_button.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';

import '../../domain/entities/movie.dart';
import '../../domain/entities/series.dart';
import '../bloc/favorites/favorite_bloc.dart';
import '../bloc/favorites/favorite_event.dart';
import '../bloc/favorites/favorite_state.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        title: const Text(AppStrings.myFavorites),
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
      child: Stack(
        children: [
          Column(
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
          Positioned(
            top: 8,
            right: 8,
            child: FavoriteToggleButton(media: movie),
          ),
        ],
      ),
    );
  }

  Widget _buildSeriesCard(Series series) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Column(
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
          Positioned(
            top: 8,
            right: 8,
            child: FavoriteToggleButton(media: series),
          ),
        ],
      ),
    );
  }
}