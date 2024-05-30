import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/entities/series.dart';
import '../../bloc/favorites/favorite_bloc.dart';
import '../../bloc/favorites/favorite_state.dart';
import '../../pages/movies_details_screen.dart';
import '../../pages/series_details_screen.dart';
import 'favorite_toggle_button.dart';

class MediaList extends StatelessWidget {
  final List<dynamic>? mediaList;
  final List<Movie> movies;
  final List<Series> series;
  final String title;

  const MediaList({
    Key? key,
    required this.mediaList,
    required this.title,
    required this.movies,
    required this.series,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mediaList?.length ?? 0,
            itemBuilder: (context, index) {
              final media = mediaList![index];
              return GestureDetector(
                onTap: () {
                  if (media is Movie) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(item: media),
                      ),
                    );
                  } else if (media is Series) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeriesDetailsScreen(item: media),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 155,
                    width: 120,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${media.backdropPath}',
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: BlocBuilder<FavoriteBloc, FavoriteState>(
                            builder: (context, state) {
                              bool isFavorite = false;
                              if (state is FavoritesLoadedState) {
                                if (media is Movie) {
                                  isFavorite = state.favoriteMovies.any((movie) => movie.id == media.id);
                                } else if (media is Series) {
                                  isFavorite = state.favoriteSeries.any((series) => series.id == media.id);
                                }
                              }
                              return FavoriteToggleButton(media: media);
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              media is Movie ? media.title.toString() : (media as Series).name.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
