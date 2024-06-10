import 'package:r6_moovie_app/domain/entities/movie.dart';
import 'package:r6_moovie_app/domain/entities/series.dart';

final moviesMock = Movie(
    adult: true,
    backdropPath: 'godzilla.jpg',
    genreIds: [1, 2],
    id: 1,
    originalLanguage: 'en',
    originalTitle: '',
    overview: '',
    popularity: 2.5,
    posterPath: '',
    releaseDate: '',
    title: 'Godzilla',
    video: true,
    voteAverage: 3.1,
    voteCount: 3);

final seriesMock = Series(
    id: 1,
    name: 'Mad',
    overview: 'lorem ipsum',
    firstAirDate: 'firstAirDate',
    voteAverage: 1.0,
    posterPath: 'posterPath',
    backdropPath: 'backdropPath');
