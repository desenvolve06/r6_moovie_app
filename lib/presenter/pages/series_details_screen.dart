import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';
import '../../domain/entities/series.dart';
import '../bloc/favorites/favorite_bloc.dart';
import '../bloc/favorites/favorite_event.dart';
import '../bloc/favorites/favorite_state.dart';
import '../widgets/details/info_row.dart';
import '../widgets/details/media_detail_header.dart';
import '../widgets/details/overview.dart';
import '../widgets/details/text_list.dart';
import '../widgets/home/favorite_toggle_button.dart';
import 'series_favorites_screen.dart';

class SeriesDetailsScreen extends StatelessWidget {
  final dynamic item;

  const SeriesDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final Series series = item;
    bool isFavorite = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.details),
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
                MaterialPageRoute(builder: (context) => SeriesFavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: MediaDetailHeader(
                media: series,
                height: 250,
                action: FavoriteToggleButton(
                      isFavorite: isFavorite,
                      onChanged: (bool isFavorite) {
                        context.read<FavoriteBloc>().add(ToggleFavorite(series.id));
                      },
                    ),
              
              ),
            ),
            InfoRow(
              releaseDate: series.firstAirDate,
              vote: series.name,
              popularity: series.name,
            ),
            const SizedBox(height: 10),
            const TextList(items: [
              AppStrings.aboutSerie,
              AppStrings.reviews,
              AppStrings.cast
            ]),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: OverView(series.overview),
            ),
          ],
        ),
      ),
    );
  }
}
