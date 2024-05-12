import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/presentation/bloc/movie_bloc/movie_bloc.dart';
import 'package:r6_moovie_app/presentation/bloc/movie_event/movie_event.dart';
import 'package:r6_moovie_app/presentation/bloc/movie_state/movie_state.dart';
import 'package:r6_moovie_app/presentation/bloc/series_bloc/series_bloc.dart';
import 'package:r6_moovie_app/presentation/components/banner_list.dart';
import 'package:r6_moovie_app/presentation/components/media_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final MovieBloc _movieBloc = MovieBloc();
  late final SerieBloc _serieBloc = SerieBloc();

  @override
  void initState() {
    _movieBloc.add(LoadingSuccessEvent());
    _serieBloc.add(LoadingSuccessEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          BlocBuilder<MovieBloc, MovieState>(
            bloc: _movieBloc,
            builder: (context, movieState) {
              return BlocBuilder<SerieBloc, MovieState>(
                bloc: _serieBloc,
                builder: (context, serieState) {
                  if (movieState is LoadedSuccessState &&
                      serieState is LoadedSuccessState) {
                    return Column(
                      children: [
                        BannerList(
                          title: "Series pop",
                          bannerList: serieState.series,
                        ),
                        const Padding(padding: EdgeInsets.all(6.0)),
                        MediaList(
                          title: "Recomendados",
                          mediaList: movieState.movies, movies: [], series: [],
                        ),
                        const Padding(padding: EdgeInsets.all(6.0)),
                        MediaList(
                          title: "Series",
                          mediaList: serieState.series, movies: [], series: [],
                        ),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
