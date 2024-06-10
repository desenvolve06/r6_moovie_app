import 'package:test/test.dart';
import 'package:r6_moovie_app/domain/entities/movie.dart';

import '../../stubs/stub.dart';

void main() {
  late Movie movie;

  setUp(() {
    movie = moviesMock;
  });

  group('Movie entity', () {
    test('Should create a Movie instance with correct values', () {
      expect(movie.id, 1);
      expect(movie.title, 'Godzilla');
      expect(movie.overview, '');
      expect(movie.voteAverage, 3.1);
    });

    test('Deve falhar ao criar uma instância de Movie com valores corretos', () {
      final movieWithIncorrectValues = Movie(
        id: 3000,
        title: 'Tartarugas mecanicas',
        overview: 'O mestre splinter não adotou elas e tiveram que trabalhar em uma oficina',
        voteAverage: -1.0, 
        adult: false, backdropPath: '', genreIds: [], originalLanguage: '', originalTitle: '', popularity: 0, posterPath: '', releaseDate: '', video: false, voteCount: 0,
      );

      expect(movieWithIncorrectValues.id, isNot(movie.id));
      expect(movieWithIncorrectValues.title, isNot(movie.title));
      expect(movieWithIncorrectValues.overview, isNot(movie.overview));
    });

  });
}
