import 'package:test/test.dart';
import 'package:r6_moovie_app/domain/entities/series.dart';

import '../../stubs/stub.dart';

void main() {
  late Series series;

  setUp(() {
    series = seriesMock;
  });

  group('Series entity', () {
    test('Should create a Series instance with correct values', () {
      expect(series.id, 1);
      expect(series.name, 'Mad');
      expect(series.overview, 'lorem ipsum');
      expect(series.voteAverage, 1.0);
    });

    
     test('Falha ao criar uma instância com campos que existem', () {
      final seriesWithIncorrectValues = Series(
        id: 909090,
        name: 'Esse não é o godzilla',
        overview: 'Histórias de um dinossauro com crise de identidade',
        voteAverage: -1.0,
        firstAirDate: '',
        posterPath: '',
        backdropPath: '',
      );
      expect(seriesWithIncorrectValues.id, isNot(series.id));
      expect(seriesWithIncorrectValues.name, isNot(series.name));
      expect(seriesWithIncorrectValues.overview, isNot(series.overview));
    });

  });
}
