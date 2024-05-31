import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/domain/entities/series.dart';
import '../../bloc/favorites/favorite_bloc.dart';
import '../../bloc/favorites/favorite_state.dart';

class FavoritesSeriesScreen extends StatelessWidget {
  final List<Series> series = [];

  FavoritesSeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Series'),
      ),
      body: BlocBuilder<FavoriteBloc,FavoriteState>(
        builder: (context, state) {
          if (state is FavoritesLoadedState) {
            return ListView.builder(
              itemCount: state.favoriteSeries.length,
              itemBuilder: (context, index) {
                final series = state.favoriteSeries[index];
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
