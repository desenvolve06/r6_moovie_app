import 'package:flutter/material.dart';
import 'package:r6_moovie_app/presentation/components/details/media_detail_header.dart';
import '../../domain/entities/movies.dart';
import '../components/details/info_row.dart';
import '../components/details/overview.dart';
import '../components/details/text_list.dart';

class MovieDetailsScreen extends StatelessWidget {
  final dynamic item;
  const MovieDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final Movies movie = item;
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
              child:MediaDetailHeader(media: movie, height: 60),
            ),
            InfoRow(
                releaseDate: movie.releaseDate.toString(),
                vote: movie.voteCount.toString(),
                popularity: movie.popularity.toString(),
            ),
            const SizedBox(height: 10),
            const TextList(items: ["About Movie", "Review", "Cast"],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: OverView(movie.overview),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailHeader {
}