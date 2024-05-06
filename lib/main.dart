import 'package:flutter/material.dart';
import 'package:r6_moovie_app/models/movies_model.dart';
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
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 219, 242, 41)),
        title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.movie,
          color: Color.fromARGB(255, 219, 242, 41)),        
          Text(
            'KoruFlix',
            style: TextStyle(fontSize: 20, 
            color: Color.fromARGB(255, 219, 242, 41)),
          ),
        ],
      ),

      actions: [
          IconButton(
            icon: const Icon(Icons.more_vert,
            color: Color.fromARGB(255, 219, 242, 41)
            ),
            onPressed: () {
            },
          ),
        ],

      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 219, 242, 41),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(height: 60),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold),
              ),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text(
                'My Profile',
                style: TextStyle(fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold),
              ),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text(
                'Downloads',
                style: TextStyle(fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold),
              ),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text(
                'Popular',
                style: TextStyle(fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold),
              ),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text(
                'Suggestions',
                style: TextStyle(fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold),
              ),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text(
                'Options',
                style: TextStyle(fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold),
              ),
              onTap: () {
                
              },
            ),
          ],
        ),
      ),
      
      body: Container(
        color: const Color(0xFF1D2026),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 380,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(color: Color.fromARGB(255, 219, 242, 41)), 
                          ),
                          child: const TextField(    
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), 
                              border: InputBorder.none, 
                              suffixIcon: Icon(Icons.search, color: Color.fromARGB(255, 219, 242, 41)),
                              suffixIconConstraints: BoxConstraints(minWidth: 48, minHeight: 48),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 32,
                ),
                padding: const EdgeInsets.all(16),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500${movies[index].backdropPath}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            movies[index].title,
                            style: const TextStyle(
                              color: Colors.indigoAccent,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          subtitle: Text(
                            'Original Title: ${movies[index].originalTitle}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}