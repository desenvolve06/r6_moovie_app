import '../models/series_model.dart';

class PopularSeriesData {
  List<SeriesModels> getSeries() {
    return [
      SeriesModels(
        id: 1,
        name: 'Breaking Bad',
        overview:
            'A high school chemistry teacher turned methamphetamine manufacturer.',
        firstAirDate: '2008-01-20',
        numberOfSeasons: 5,
        numberOfEpisodes: 62,
        genres: ['Crime', 'Drama', 'Thriller'],
        voteAverage: 9.2,
        posterPath: '/rYCd6sLam5S4tMUUHdCXEWoBGsf.jpg',
        backdropPath: '/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg',
      ),
      SeriesModels(
        id: 2,
        name: 'Stranger Things',
        overview:
            'When a young boy disappears, his mother, a police chief, and his friends must confront terrifying supernatural forces in order to get him back.',
        firstAirDate: '2016-07-15',
        numberOfSeasons: 4,
        numberOfEpisodes: 34,
        genres: ['Drama', 'Fantasy', 'Horror'],
        voteAverage: 8.7,
        posterPath: '/oqkld2D0qcnSNRm15rYV2883JE3.jpg',
        backdropPath: '/56v2KjBlU4XaOv9rVYEQypROD7P.jpg',
      ),
      SeriesModels(
        id: 3,
        name: 'Game of Thrones',
        overview:
            'Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.',
        firstAirDate: '2011-04-17',
        numberOfSeasons: 8,
        numberOfEpisodes: 73,
        genres: ['Action', 'Adventure', 'Drama'],
        voteAverage: 9.3,
        posterPath: '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
        backdropPath: '/suopoADq0k8YZr4dQXcU6pToj6s.jpg',
      ),
      SeriesModels(
        id: 4,
        name: 'The Crown',
        overview:
            'Follows the political rivalries and romance of Queen Elizabeth II\'s reign and the events that shaped the second half of the twentieth century.',
        firstAirDate: '2016-11-04',
        numberOfSeasons: 4,
        numberOfEpisodes: 40,
        genres: ['Biography', 'Drama', 'History'],
        voteAverage: 8.7,
        posterPath: '/4m2JzpWYAeeBtY76o5IfBP0l3JR.jpg',
        backdropPath: '/8VXhcrl5z2I1zEU9X3pkkNrZlD.jpg',
      ),
      SeriesModels(
        id: 5,
        name: 'Friends',
        overview:
            'Follows the personal and professional lives of six twenty to thirty-something-year-old friends living in Manhattan.',
        firstAirDate: '1994-09-22',
        numberOfSeasons: 10,
        numberOfEpisodes: 236,
        genres: ['Comedy', 'Romance'],
        voteAverage: 8.4,
        posterPath: '/2koX1xLkpTQM4IZebYvKysFW1Nh.jpg',
        backdropPath: '/o0TYvii1gab1ThmGFegpF4iyDwf.jpg',
      ),
    ];
  }
}
