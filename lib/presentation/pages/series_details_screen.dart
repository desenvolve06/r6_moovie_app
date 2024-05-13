import 'package:flutter/material.dart';
import 'package:r6_moovie_app/data/models/series_model.dart';
import 'package:r6_moovie_app/presentation/components/details/media_detail_header.dart';
import '../components/details/info_row.dart';
import '../components/details/overview.dart';
import '../components/details/text_list.dart';

class SeriesDetailsScreen extends StatelessWidget {
  final dynamic item;

  const SeriesDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final SeriesModels series = item;

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
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: MediaDetailHeader(media: series, height: 60),
            ),
            InfoRow(
              releaseDate: series.firstAirDate,
              duration: series.numberOfSeasons.toString(),
              genreIds: series.numberOfEpisodes.toString(),
            ),
            const SizedBox(height: 10),
            const TextList(items: ["About Series", "Review", "Cast"]),
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

