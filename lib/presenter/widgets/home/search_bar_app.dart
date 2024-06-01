import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:r6_moovie_app/domain/entities/movie.dart';
import 'package:r6_moovie_app/presenter/pages/movies_details_screen.dart';
import 'package:r6_moovie_app/resources/app_colors.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  final TextEditingController searchText = TextEditingController();
  List<Map<String, dynamic>> searchResult = [];
  bool showSearchResults = false;

  Future<void> searchListFunction(String val) async {
    final dio = Dio();
    final apiKey = dotenv.env['API_KEY'];
    final searchUrl =
        'https://api.themoviedb.org/3/search/multi?api_key=$apiKey&query=$val';

    try {
      final searchResponse = await dio.get(searchUrl);
      if (searchResponse.statusCode == 200) {
        final tempData = searchResponse.data;
        final searchJson = tempData['results'];

        final filteredResults = searchJson
            .where((result) => result['media_type'] != 'person')
            .toList();

        final tempSearchResult =
            filteredResults.map((result) => Movie.fromMap(result)).toList();

        setState(() {
          searchResult = tempSearchResult.take(5).toList();
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.primaryColorLight),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SearchBar(
                            hintText: AppStrings.search,
                            onChanged: (value) {
                              searchListFunction(value);
                            },
                            leading: const Icon(Icons.search,
                                color: AppColors.primaryColorLight),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                final result = searchResult[index];
                final Movie movie = Movie.fromMap(result);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(
                          item: Movie.fromMap(result),
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: result['poster_path'] != null
                        ? Image.network(
                            'https://image.tmdb.org/t/p/w92${result['poster_path']}',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : const SizedBox(
                            width: 100,
                            height: 100,
                          ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          result.containsKey('title')
                              ? result['title']
                              : result['name'] ?? '',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rating: ${result['vote_average'].toStringAsFixed(1)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
