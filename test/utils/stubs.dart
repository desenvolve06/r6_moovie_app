import 'package:r6_moovie_app/domain/entities/movie.dart';
import 'package:r6_moovie_app/domain/entities/series.dart';

final movie = Movie(
    adult: true,
    backdropPath: '',
    genreIds: [1, 2],
    id: 1,
    originalLanguage: 'en',
    originalTitle: '',
    overview: '',
    popularity: 2.5,
    posterPath: '',
    releaseDate: '',
    title: '',
    video: true,
    voteAverage: 3.1,
    voteCount: 3);

final series = Series(
    id: 1,
    name: '',
    overview: '',
    firstAirDate: '',
    voteAverage: 2.5,
    posterPath: '',
    backdropPath: '');