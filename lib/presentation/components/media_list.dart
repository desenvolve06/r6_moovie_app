import 'package:flutter/material.dart';
import 'package:r6_moovie_app/data/models/movies_model.dart';
import 'package:r6_moovie_app/data/models/series_model.dart';
import 'package:r6_moovie_app/presentation/screens/movies_details_screen.dart';

class MediaList extends StatelessWidget {
  final List<dynamic>? mediaList;
  final List<MoviesModels> movies;
  final String title;

  const MediaList({
    super.key,
    required this.mediaList,
    required this.title, required this.movies,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsScreen(item: media),
                    ),
                  );
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
                            "https://image.tmdb.org/t/p/w500${media.backdropPath}",
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              media is MoviesModels
                                  ? (media).title.toString()
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
