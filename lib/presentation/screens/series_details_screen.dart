import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/series_model.dart';

class SeriesDetailsScreen extends StatelessWidget {
  final dynamic item;

  const SeriesDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Extrai os detalhes do filme do argumento item
    final SeriesModels serie = item;

    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('https://image.tmdb.org/t/p/w500${serie.posterPath}'),
              Text('Título: ${serie.name}'),
              Text('Resumo: ${serie.overview}'),
              Text('Data de Lançamento: ${serie.firstAirDate}'),
              Text('Número de episódios: ${serie.numberOfEpisodes.toInt()}'),
              Text('Númeo de seasons: ${serie.numberOfSeasons}'),
              Text('Avaliação: ${serie.genres}'),
              Text('Total de Votos: ${serie.voteAverage}'),
              Text('Gêneros: ${serie.genres}'),
              // Substitua 'src' pela URL do pôster do filme

            ],
          ),
        ),
      ),
    );
  }
}
