import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/presentation/bloc/series/series_bloc.dart';
import 'package:r6_moovie_app/presentation/components/home/banner_list.dart';
import '../bloc/movies/movie_bloc.dart';
import '../bloc/movies/movie_event.dart';
import '../bloc/movies/movie_state.dart';
import '../bloc/series/series_event.dart';
import '../bloc/series/series_state.dart';
import '../components/home/media_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {
  late final MovieBloc _movieBloc;

  late final SeriesBloc _seriesBloc = SeriesBloc();

  @override
  void initState() {
    _movieBloc = BlocProvider.of<MovieBloc>(context);
    SeriesBloc();
    _movieBloc.add(LoadingSuccessEvent());
    _seriesBloc.add(LoadingSeriesSuccessEvent());
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
              return BlocBuilder<SeriesBloc, SeriesState>(
                bloc: _seriesBloc,
                builder: (context, serieState) {
                  if (movieState is LoadingState || serieState is LoadingSeriesState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (movieState is LoadedSuccessState && serieState is LoadedSeriesSuccessState) {
                    return Column(
                      children: [
                        BannerList(
                          title: "Series pop",
                          bannerList: serieState.series,
                        ),
                        const Padding(padding: EdgeInsets.all(6.0)),
                        MediaList(
                          title: "Recomendados",
                          mediaList: movieState.movies ?? [], movies: [], series: [],
                        ),
                        const Padding(padding: EdgeInsets.all(6.0)),
                        MediaList(
                          title: "Series",
                          mediaList: serieState.series ?? [], movies: [], series: [],
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
