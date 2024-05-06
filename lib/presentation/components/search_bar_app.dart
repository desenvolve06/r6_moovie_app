import 'package:flutter/material.dart';
import '../../../models/movies_model.dart';

class SearchBarApp extends StatefulWidget {
  final List<MoviesModels> movies;

  const SearchBarApp({super.key, required this.movies});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 219, 242, 41)),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.8,
                child: SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.zero),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: const Icon(Icons.search,
                      color: Color.fromARGB(255, 219, 242, 41)),
                ),
              ),
            ),
          );
        },
        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(widget.movies.length, (int index) {
            final String movie = widget.movies[index].title;
            return ListTile(
              title: Text(movie),
              onTap: () {
                setState(() {
                  controller.closeView(movie);
                });
              },
            );
          });
        },
      ),
    );
  }
}
