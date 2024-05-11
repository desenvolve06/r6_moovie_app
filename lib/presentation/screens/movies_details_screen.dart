import 'package:flutter/material.dart';
import '../../data/models/movies_model.dart';
import '../components/details/movie_detail_header.dart';
import '../components/details/overview..dart';

class MovieDetailsScreen extends StatelessWidget {
  final dynamic item;

  const MovieDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final MoviesModels movie = item;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_sharp),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieDetailHeader(movie:movie, posterUrl: '', height: 60),
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
