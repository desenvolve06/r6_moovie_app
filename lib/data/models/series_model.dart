import '../../domain/entities/series.dart';

class SeriesModels {
  final int id;
  final String name;
  final String overview;
  final String firstAirDate;
  final double voteAverage;
  final String? posterPath;
  final String? backdropPath;

  SeriesModels({
    required this.id,
    required this.name,
    required this.overview,
    required this.firstAirDate,
    required this.voteAverage,
    this.posterPath,
    this.backdropPath,
  });

  SeriesModels copyWith({
    int? id,
    String? name,
    String? overview,
    String? firstAirDate,
    double? voteAverage,
    String? posterPath,
    String? backdropPath,
  }) {
    return SeriesModels(
        id: id ?? this.id,
        name: name ?? this.name,
        overview: overview ?? this.overview,
        firstAirDate: firstAirDate ?? this.firstAirDate,
        voteAverage: voteAverage ?? this.voteAverage,
        posterPath: posterPath ?? this.posterPath,
        backdropPath: backdropPath ?? this.backdropPath
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'overview': overview,
      'firstAirDate': firstAirDate,
      'voteAverage': voteAverage,
      'posterPath': posterPath,
      'backdropPath': backdropPath,
    };
  }

  factory SeriesModels.fromJson(Map<String, dynamic> json) {
    return SeriesModels(
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      firstAirDate: json['first_air_date'],
      voteAverage: json['vote_average'].toDouble(),
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }

  Series toEntity() {
    return Series(
      id: id,
      name: name,
      overview: overview,
      firstAirDate: firstAirDate,
      voteAverage: voteAverage,
      posterPath: posterPath,
      backdropPath: backdropPath,
    );
  }
}

