import 'package:flutter/material.dart';
import 'package:r6_moovie_app/presentation/bloc/movies/movie_bloc.dart';
import 'package:r6_moovie_app/presentation/components/home/appBar_main.dart';
import 'package:r6_moovie_app/presentation/components/home/navBar_main.dart';
import 'package:r6_moovie_app/presentation/components/home/search_bar_app.dart';
import 'package:r6_moovie_app/presentation/pages/main_screen.dart';
import 'package:r6_moovie_app/presentation/pages/splash_screen.dart';
import 'package:r6_moovie_app/resources/app_colors.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/presentation/bloc/series/series_bloc.dart';
import 'injection/injection.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => getIt<MovieBloc>()),
      BlocProvider(create: (context) => getIt<SeriesBloc>()),
    ],
    child: MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(background: AppColors.primaryBackgroundColor),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      )
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
          SearchBarApp(),
          Expanded(
            child: MainScreen(),
          ),
        ],
      ),
    );
  }
}
