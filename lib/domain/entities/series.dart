class Series {
  final int id;
  final String name;
  final String overview;
  final String firstAirDate;
  final double voteAverage;
  final String? posterPath;
  final String? backdropPath;
  Series({
    required this.id,
    required this.name,
    required this.overview,
    required this.firstAirDate,
    required this.voteAverage,
    required this.posterPath,
    required this.backdropPath
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'overview': overview,
      'firstAirDate': firstAirDate,
      'voteAverage': voteAverage,
      'posterPath': posterPath,
      'backdropPath': backdropPath
    };
  }
  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        firstAirDate: json['firstAirDate'],
        voteAverage: json['voteAverage'],
        posterPath: json['posterPath'],
        backdropPath: json['backdropPath']
    );
  }
}