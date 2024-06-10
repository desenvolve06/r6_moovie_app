import 'package:r6_moovie_app/domain/entities/series.dart';

final List<Series> mockSeries = [
  Series(
    id: 1,
    name: 'Test Series 1',
    overview: 'Overview 1',
    firstAirDate: '2021-01-01',
    voteAverage: 8.0,
    posterPath: '/poster1.jpg',
    backdropPath: '/path1.jpg',
  ),
  Series(
    id: 2,
    name: 'Test Series 2',
    overview: 'Overview 2',
    firstAirDate: '2021-02-01',
    voteAverage: 7.0,
    posterPath: '/poster2.jpg',
    backdropPath: '/path2.jpg',
  ),
];