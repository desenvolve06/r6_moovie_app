import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/models/movies_model.dart';
import 'package:r6_moovie_app/models/series_model.dart';
import 'package:r6_moovie_app/presentation/bloc/movie_bloc/movie_bloc.dart';
import 'package:r6_moovie_app/presentation/bloc/movie_event/movie_event.dart';
import 'package:r6_moovie_app/presentation/bloc/movie_state/movie_state.dart';
import 'package:r6_moovie_app/presentation/bloc/series_bloc.dart/series_bloc.dart';
import 'package:r6_moovie_app/presentation/components/banner_list.dart';
import 'package:r6_moovie_app/presentation/components/media_list.dart'; // Import MediaList

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

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
          // BLOCO DE COMPONENTE BASTA PASSAR OS DADOS EM BANNERLIST
          BlocBuilder<MovieBloc, MovieState>(
            bloc: _movieBloc,
            builder: (context, state) {
              if (state is LoadedSuccessState) {
                return BannerList(
                  title: "Popular",
                  bannerList: state.movies,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.all(6.0),
          ),
          // BLOCO DE COMPONENTE BASTA PASSAR OS DADOS EM MEDIALIST
          BlocBuilder<MovieBloc, MovieState>(
            bloc: _movieBloc,
            builder: (context, state) {
              if (state is LoadedSuccessState) {
                return MediaList(
                  title: "Recomendados",
                  mediaList: state.movies,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.all(6.0),
          ),
          // BLOCO DE COMPONENTE BASTA PASSAR OS DADOS EM MEDIALIST
          BlocBuilder<SerieBloc, MovieState>(
            bloc: _serieBloc,
            builder: (context, state) {
              if (state is LoadedSuccessState) {
                return MediaList(
                  title: "Series",
                  mediaList: state.series,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
