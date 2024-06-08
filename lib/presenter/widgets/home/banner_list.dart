import 'package:flutter/material.dart';
import '../../../resources/app_values.dart';
import '../../pages/series_details_screen.dart';
import '../home/card_image.dart';
import '../home/card_image_text.dart';

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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: AppSize.s20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bannerList?.length ?? 0,
            itemBuilder: (context, index) {
              final banner = bannerList![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeriesDetailsScreen(item: banner),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    width: 400,
                    child: Stack(
                      children: [
                        CardImage(media: banner),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: CardImageText(media: banner),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
