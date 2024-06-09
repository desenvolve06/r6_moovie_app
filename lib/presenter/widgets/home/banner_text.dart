import 'package:flutter/cupertino.dart';

import '../../../resources/app_values.dart';

class BannerText extends StatelessWidget {
  final dynamic title;

  const BannerText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title.toString(),
        style: const TextStyle(
          fontSize: AppSize.s20,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}