import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  setUpAll(() async {
    await dotenv.load(fileName: '.env');
  });
  group('Get popular series from TMDB API', () {
    test('Should retrieve popular series data from TMDB API', () async {
      final movies = await fetchPopularSeries();
      expect(movies, isA<List>());
    });
  });
}

Future<List> fetchPopularSeries() async {
  final apiKey = dotenv.env['API_KEY'];
  final uri =
      Uri.parse('https://api.themoviedb.org/3/tv/popular?api_key=$apiKey');
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);
    return responseBody['results'];
  } else {
    throw Exception('Failed to load popular series data');
  }
}
