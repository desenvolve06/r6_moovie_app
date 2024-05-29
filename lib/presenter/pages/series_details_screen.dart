import 'package:flutter/material.dart';
import 'package:r6_moovie_app/presenter/pages/series/favorites_series_screen.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';
import '../../domain/entities/series.dart';
import '../widgets/details/info_row.dart';
import '../widgets/details/media_detail_header.dart';
import '../widgets/details/overview.dart';
import '../widgets/details/text_list.dart';
import '../widgets/home/favorite_toggle_button_series.dart';

class SeriesDetailsScreen extends StatelessWidget {
  final dynamic item;
  const SeriesDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final Series series = item;

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
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesSeriesScreen()),
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
                height: 60,
                action: FavoriteToggleButtonSeries(series: series),
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
