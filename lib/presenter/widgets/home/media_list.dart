import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/entities/series.dart';
import '../../../resources/app_values.dart';
import '../../bloc/favorites/favorite_bloc.dart';
import '../../bloc/favorites/favorite_event.dart';
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
    super.key,
    required this.mediaList,
    required this.title,
    required this.movies,
    required this.series,
  });

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteBloc>().add(GetFavoritesEvent());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: AppSize.s24,
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
                          child: CachedNetworkImage(
                            imageUrl: "https://image.tmdb.org/t/p/w500${media.backdropPath}",
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: BlocBuilder<FavoriteBloc, FavoriteState>(
                            builder: (context, state) {
                              bool isFavorite = false;
                              if (state is FavoritesLoadedState) {
                                isFavorite = state.favoriteMovieIds.contains(media.id);
                              }
                              return FavoriteToggleButton(
                                isFavorite: isFavorite,
                                onChanged: (bool isFavorite) {
                                  if(media is Movie){
                                    _toggleFavorite(media, isFavorite, context);
                                  }
                                  else{
                                    _toggleSerieFavorite(media, isFavorite, context);
                                  }                                 
                                },
                              );
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

  void _toggleFavorite(Movie movie, bool isFavorite, BuildContext context) {
    final favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    if (isFavorite) {
      favoriteBloc.add(RemoveFromFavoritesEvent(movie.id));
    } else {
      favoriteBloc.add(AddToFavoritesEvent(movie.id));
    }
  }

  void _toggleSerieFavorite(Series series, bool isFavorite, BuildContext context) {
    final favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    if (isFavorite) {
      favoriteBloc.add(RemoveFromFavoritesEvent(series.id));
    } else {
      favoriteBloc.add(AddToFavoritesEvent(series.id));
    }
  }
}