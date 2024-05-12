import 'package:flutter/material.dart';
import 'package:r6_moovie_app/presentation/components/details/info_row.dart';
import '../../data/models/movies_model.dart';
import '../components/details/movie_detail_header.dart';
import '../components/details/overview..dart';
import '../components/details/text_list.dart';

class MovieDetailsScreen extends StatelessWidget {
  final dynamic item;
  const MovieDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final MoviesModels movie = item;

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
              child: MovieDetailHeader(movie: movie, height: 60),
            ),
            InfoRow(
                releaseDate: movie.releaseDate,
                duration: '120 min',
                genreIds: movie.genreIds.toString()
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

