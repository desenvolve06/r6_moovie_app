import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/movies/movie_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/series/series_bloc.dart';
import 'package:r6_moovie_app/presenter/pages/main_screen.dart';
import 'package:r6_moovie_app/presenter/pages/splash_screen.dart';
import 'package:r6_moovie_app/presenter/widgets/home/app_bar_main.dart';
import 'package:r6_moovie_app/presenter/widgets/home/nav_bar_main.dart';
import 'package:r6_moovie_app/presenter/widgets/home/search_bar_app.dart';
import 'package:r6_moovie_app/resources/app_colors.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';

import 'di/injection.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<MovieBloc>()),
          BlocProvider(create: (context) => getIt<SeriesBloc>()),
          BlocProvider(create: (context) => getIt<FavoriteBloc>()),
        ],
        child: MaterialApp(
          title: AppStrings.appTitle,
          theme: ThemeData(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primaryColor,
              secondary: AppColors.secondaryColor,
              surface: AppColors.primaryBackgroundColor,
              background: AppColors.secondaryBackgroundColor,
              error: AppColors.errorColor,
              onPrimary: AppColors.secondaryText,
              onSecondary: AppColors.secondaryText,
              onSurface: AppColors.secondaryText,
              onError: AppColors.errorColor,
              brightness: Brightness.dark,
            ),
            fontFamily: 'Montserrat',
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ));
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
