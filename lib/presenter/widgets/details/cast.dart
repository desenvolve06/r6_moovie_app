import 'package:flutter/material.dart';
import 'package:r6_moovie_app/resources/app_colors.dart';
import 'package:r6_moovie_app/resources/app_values.dart';

class Cast extends StatelessWidget {
  const Cast(this.overview, {super.key});
  final String overview;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        Text(
          overview,
          style: textTheme.bodyLarge?.copyWith(
              color: AppColors.secondaryText,
              fontSize: AppSize.s16,
              fontFamily: 'Lora'),
        ),
      ],
    );
  }
}