import 'package:json_annotation/json_annotation.dart';
import 'package:r6_moovie_app/data/models/series_model.dart';
part 'series_response.g.dart';

@JsonSerializable()
class SeriesResponse{
  List<SeriesModels> results;
  SeriesResponse({required this.results});

  factory SeriesResponse.fromJson(Map<String, dynamic> json) => _$SeriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesResponseToJson(this);
}