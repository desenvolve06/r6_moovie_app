import 'package:flutter/material.dart';
import 'package:r6_moovie_app/presentation/components/home/appBar_main.dart';
import 'package:r6_moovie_app/presentation/components/home/navBar_main.dart';
import 'package:r6_moovie_app/presentation/components/home/search_bar_app.dart';
import 'package:r6_moovie_app/presentation/pages/main_screen.dart';
import 'package:r6_moovie_app/presentation/pages/splash_screen.dart';

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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarMain(),
      drawer: NavBarMain(),
      body: Column(
        children: [
          SearchBarApp(
            movies:[],
          ),
          Expanded(
            child: MainScreen(),
          ),
        ],
      ),
    );
  }
}
