import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/presentation/bloc/series_bloc.dart/series_bloc.dart';
import '../bloc/movie_bloc/movie_bloc.dart';
import '../bloc/movie_event/movie_event.dart';
import '../bloc/movie_state/movie_state.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
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
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Popular",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: _buildListMovie(),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Series",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: _buildListSeries(),
          ),
        ],
      ),
    );
  }

  Widget _buildListMovie() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            create: (context) => _movieBloc,
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is ErrorState) {
                  return Center(
                    child: Text(
                      state.error!,
                    ),
                  );
                } else if (state is InitialState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoadedSuccessState) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 300.0,
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: false,
                    ),
                    items: state.movies?.map((movie) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
                                        height: 150,
                                        width: MediaQuery.of(context).size.width * 0.8,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      movie.title.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList() ??
                        [],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListSeries() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            create: (context) => _serieBloc,
            child: BlocBuilder<SerieBloc, MovieState>(
              builder: (context, state) {
                if (state is ErrorState) {
                  return Center(
                    child: Text(
                      state.error!,
                    ),
                  );
                } else if (state is InitialState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoadedSuccessState) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 300.0,
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: false,
                    ),
                    items: state.series?.map((series) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        "https://image.tmdb.org/t/p/w500${series.backdropPath}",
                                        height: 150,
                                        width: MediaQuery.of(context).size.width * 0.8,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      series.name.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList() ??
                        [],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
