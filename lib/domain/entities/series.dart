import 'dart:ffi';

class Series {
  final int id;
  final String name;
  final String overview;
  final String firstAirDate;
  final double voteAverage;
  final String? posterPath;
  final String? backdropPath;

  Series(
      {required this.id,
      required this.name,
      required this.overview,
      required this.firstAirDate,
      required this.voteAverage,
      required this.posterPath,
      required this.backdropPath});
}
