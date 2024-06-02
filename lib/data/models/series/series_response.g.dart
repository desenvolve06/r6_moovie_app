// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesResponse _$SeriesResponseFromJson(Map<String, dynamic> json) =>
    SeriesResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => SeriesModels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesResponseToJson(SeriesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
