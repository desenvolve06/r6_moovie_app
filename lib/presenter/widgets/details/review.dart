import 'package:flutter/material.dart';
import 'package:r6_moovie_app/resources/app_colors.dart';
import 'package:r6_moovie_app/resources/app_values.dart';

class Review extends StatefulWidget {
  final String review;

  const Review(this.review, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        Text(
          widget.review,
          style: textTheme.bodyLarge?.copyWith(
              color: AppColors.secondaryText,
              fontSize: AppSize.s16,
              fontFamily: 'Lora'),
        ),
      ],
    );
  }
}
