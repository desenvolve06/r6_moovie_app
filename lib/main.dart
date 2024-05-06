import 'package:flutter/material.dart';
import 'package:r6_moovie_app/models/movies_model.dart';
import 'package:r6_moovie_app/presentation/components/navBar_main.dart';
import 'package:r6_moovie_app/presentation/components/search_bar_app.dart';
import 'package:r6_moovie_app/presentation/screens/movie_screen.dart';
import 'package:r6_moovie_app/presentation/screens/splash_screen.dart';
import 'data/popular_movies_mock/popular_movies_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KoruFlix',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(background: Color(0xFF1D2026)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<MoviesModels> movies = PopularMoviesData().getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 32, 38),
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 127, 140, 40)),
        title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.movie,
          color: Color.fromARGB(255, 127, 140, 40)),
          Text(
            'KoruFlix',
            style: TextStyle(fontSize: 20,
            color: Color.fromARGB(255, 127, 140, 40)),
          ),
        ],
      ),

      actions: [
          IconButton(
            icon: const Icon(Icons.more_vert,
            color: Color.fromARGB(255, 127, 148, 40)
            ),
            onPressed: () {
            },
          ),
        ],
      ),
      drawer: NavBarMain(),
      body: const Column(
        children: [
          SearchBarApp(movies: []),
          Expanded(
              child: MovieScreen()),
        ],
      ),
    );
  }
}