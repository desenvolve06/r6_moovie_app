import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:r6_moovie_app/data/models/series_model.dart';
import 'package:r6_moovie_app/presentation/pages/movies_details_screen.dart';
import 'package:r6_moovie_app/resources/app_values.dart';
import '../../../domain/entities/movies.dart';
import '../../pages/series_details_screen.dart';

class MediaList extends StatelessWidget {
  final List<dynamic>? mediaList;
  final List<Movies> movies;
  final List<SeriesModels> series;
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
                  if (media is Movies) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(item: media),
                      ),
                    );
                  } else if (media is SeriesModels) {
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
                          child: CachedNetworkImage(imageUrl:
                            "https://image.tmdb.org/t/p/w500${media.backdropPath}",
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(Icons.error),
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
                              media is Movies
                                  ? (media as Movies).title.toString()
                                  : (media as SeriesModels).name.toString(),
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
