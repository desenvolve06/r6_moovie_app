// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class SeriesModels {
  final int id;
  final String name;
  final String overview;
  final String firstAirDate;
  final int numberOfSeasons;
  final int numberOfEpisodes;
  final List<String> genres;
  final double voteAverage;
  final String? posterPath;
  final String? backdropPath;

  SeriesModels({
    required this.id,
    required this.name,
    required this.overview,
    required this.firstAirDate,
    required this.numberOfSeasons,
    required this.numberOfEpisodes,
    required this.genres,
    required this.voteAverage,
    this.posterPath,
    this.backdropPath,
  });

  SeriesModels copyWith({
    int? id,
    String? name,
    String? overview,
    String? firstAirDate,
    int? numberOfSeasons,
    int? numberOfEpisodes,
    List<String>? genres,
    double? voteAverage,
  }) {
    return SeriesModels(
      id: id ?? this.id,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      numberOfSeasons: numberOfSeasons ?? this.numberOfSeasons,
      numberOfEpisodes: numberOfEpisodes ?? this.numberOfEpisodes,
      genres: genres ?? this.genres,
      voteAverage: voteAverage ?? this.voteAverage,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'overview': overview,
      'firstAirDate': firstAirDate,
      'numberOfSeasons': numberOfSeasons,
      'numberOfEpisodes': numberOfEpisodes,
      'genres': genres,
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
      numberOfSeasons: json['number_of_seasons'],
      numberOfEpisodes: json['number_of_episodes'],
      genres: List<String>.from(json['genres'].map((genre) => genre['name'])),
      voteAverage: json['vote_average'].toDouble(),
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }
}
