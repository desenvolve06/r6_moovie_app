import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/movies/movie_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/series/series_bloc.dart';
import 'package:r6_moovie_app/presenter/pages/favorites_screen.dart';
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
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: AppColors.primaryBackgroundColor,
              selectedItemColor: AppColors.greyLight1Color,
              unselectedItemColor: AppColors.greyDark1Color,
              elevation: 8,
            ),
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
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MainScreen(),
    const SearchBarApp(),
    const FavoritesScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMain(),
      drawer: const NavBarMain(),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (item) {
          setState(() {
            _currentIndex = item;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
