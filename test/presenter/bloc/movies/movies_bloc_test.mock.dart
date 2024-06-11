import 'package:r6_moovie_app/domain/entities/movie.dart';


final List<Movie> mockMovies = [
  Movie(
    adult: false,
    backdropPath: '/path1.jpg',
    genreIds: [1, 2, 3],
    id: 1,
    originalLanguage: 'en',
    originalTitle: 'Test Movie 1',
    overview: 'Overview 1',
    popularity: 100.0,
    posterPath: '/poster1.jpg',
    releaseDate: '2021-01-01',
    title: 'Test Movie 1',
    video: false,
    voteAverage: 8.0,
    voteCount: 1000,
  ),
  Movie(
    adult: false,
    backdropPath: '/path2.jpg',
    genreIds: [4, 5, 6],
    id: 2,
    originalLanguage: 'en',
    originalTitle: 'Test Movie 2',
    overview: 'Overview 2',
    popularity: 200.0,
    posterPath: '/poster2.jpg',
    releaseDate: '2021-02-01',
    title: 'Test Movie 2',
    video: false,
    voteAverage: 7.0,
    voteCount: 2000,
  ),
];