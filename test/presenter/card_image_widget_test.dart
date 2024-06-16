import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:r6_moovie_app/presenter/widgets/home/card_image.dart';

import '../stubs/stub.dart';

void main() {
  Future<void> buildApp(WidgetTester tester, dynamic media) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CardImage(media: media),
          ),
        ),
      );
      await tester.pumpAndSettle();
    });
  }

  group('CardImage Widget Tests', () {
    testWidgets('Should render CachedNetworkImage with correct URL',
        (WidgetTester tester) async {
      final media = moviesMock;

      await buildApp(tester, media);

      final cachedNetworkImageFinder = find.byType(CachedNetworkImage);

      expect(cachedNetworkImageFinder, findsOneWidget);

      final CachedNetworkImage cachedNetworkImage =
          tester.widget(cachedNetworkImageFinder);
      expect(cachedNetworkImage.imageUrl,
          'https://image.tmdb.org/t/p/w500/tMefBSflR6PGQLv7WvFPpKLZkyk.jpg');
    });

    testWidgets('Should apply correct border radius',
        (WidgetTester tester) async {
      final media = moviesMock;

      await buildApp(tester, media);

      final clipRRectFinder = find.byType(ClipRRect);

      expect(clipRRectFinder, findsOneWidget);

      final ClipRRect clipRRect = tester.widget(clipRRectFinder);
      expect(clipRRect.borderRadius, BorderRadius.circular(10.0));
    });
  });
}
