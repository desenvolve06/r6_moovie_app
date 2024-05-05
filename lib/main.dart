import 'package:flutter/material.dart';
import 'package:r6_moovie_app/presentation/page/movie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Api Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MovieScreen());
  }
}
