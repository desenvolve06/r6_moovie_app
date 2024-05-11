import 'package:flutter/cupertino.dart';
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
        Text(
          'Overview',
          style: textTheme.titleMedium
              ?.copyWith(fontSize: 18.0),
        ),
        const SizedBox(height: 8.0),
        Text(
          overview,
          style: textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'more',
              style: textTheme.bodySmall
                  ?.copyWith(fontSize: 16.0, color: Colors.white),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 18.0,
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}