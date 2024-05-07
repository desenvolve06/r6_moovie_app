import 'package:flutter/material.dart';
import 'package:r6_moovie_app/presentation/components/appBar_main.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarMain(),
      body: Center(
        child: Text('Detalhes do Filme:'),
      ),
    );
  }
}