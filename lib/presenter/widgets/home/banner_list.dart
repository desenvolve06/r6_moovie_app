import 'package:flutter/material.dart';

import 'banner_item.dart';
import 'banner_text.dart';

class BannerList extends StatelessWidget {
  final List<dynamic>? bannerList;
  final String title;

  const BannerList({
    super.key,
    required this.bannerList,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BannerText(title: title),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bannerList?.length ?? 0,
            itemBuilder: (context, index) {
              final banner = bannerList![index];
              return BannerItem(banner: banner);
            },
          ),
        ),
      ],
    );
  }
}
