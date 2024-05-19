import 'package:json_annotation/json_annotation.dart';
import 'movies_model.dart';
part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse {
  List<MoviesModels> results;
  MoviesResponse({required this.results});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}
