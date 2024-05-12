import 'package:flutter/material.dart';

class OverView extends StatelessWidget {
  const OverView(this.overview, {super.key});
  final String overview;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        Text(
          overview,
          style: textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}