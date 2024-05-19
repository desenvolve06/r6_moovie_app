import 'package:json_annotation/json_annotation.dart';
import 'movies_models.dart';
part 'moviesResponse.g.dart';

@JsonSerializable()
class MoviesResponse {
  List<MoviesModels> results;
  MoviesResponse({required this.results});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}