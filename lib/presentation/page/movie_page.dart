import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/models/movies_model.dart';
import 'package:r6_moovie_app/presentation/bloc/movie_bloc.dart';
import 'package:r6_moovie_app/presentation/bloc/movie_event.dart';
import 'package:r6_moovie_app/presentation/bloc/movie_state.dart';

import '../../data/popular_movies_mock/popular_movies_data.dart';
import '../../data/repository/movie_repository_impl.dart';
import '../../domain/repository/movie_repository.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  // final MoviesRepository _moviesRepository = MoviesRepositoryImpl(PopularMoviesData());
  late final MovieBloc _movieBloc = MovieBloc();

  @override
  void initState() {
    _movieBloc.add(GetMovieList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Flutter"),
        backgroundColor: Colors.teal,
      ),
      body: _buildListMovie(),
    );
  }

  Widget _buildListMovie() {
    return Card(
    child: Container(
      padding: const EdgeInsets.all(20.0),
      child: BlocProvider(
          create: (context) => _movieBloc,
      child:BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if(state is ErrorState) {
            return Center(
              child: Text(
               state.error!
              ),
            );
          } else if(state is InitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is  LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is LoadedSuccessState) {
            return ListView.builder(itemCount: state.movies.length,
            itemBuilder: (context, index) {
             MoviesModels moviesModels =  state.movies[index];
             return ListTile(
               title: Text(moviesModels.title.toString()),
             );
            });
          } else {
            return Container();
          }
        },
      ) ,
      ),
    ),
    );
  }
}
