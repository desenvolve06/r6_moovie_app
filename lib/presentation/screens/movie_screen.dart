import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/models/movies_model.dart';
import 'package:r6_moovie_app/models/series_model.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child:
                _buildListSeries(), // Adicione o método _buildListSeries() aqui
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
                  return ListView.builder(
                    itemCount: state.movies?.length,
                    itemBuilder: (context, index) {
                      MoviesModels moviesModels = state.movies![index];
                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500${moviesModels.backdropPath}",
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            moviesModels.title.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    },
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
                  return ListView.builder(
                    itemCount: state.series?.length,
                    itemBuilder: (context, index) {
                      SeriesModels seriesModels = state.series![index];

                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500${seriesModels.backdropPath}",
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            seriesModels.name.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    },
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
