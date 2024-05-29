import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/domain/entities/series.dart';
import '../../bloc/favorites/series/favorite_bloc_series.dart';
import '../../bloc/favorites/series/favorite_state_series.dart';



class FavoritesSeriesScreen extends StatelessWidget {
  final List<Series> series = [];

  FavoritesSeriesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Series'),
      ),
      body: BlocBuilder<FavoriteBlocSeries, FavoriteStateSeries>(
        builder: (context, state) {
          if (state is FavoritesLoadedStateSeries) {
            return ListView.builder(
              itemCount: state.favoriteSeriesIds.length,
              itemBuilder: (context, index) {
                final series = state.favoriteSeriesIds[index];
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
