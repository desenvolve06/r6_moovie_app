import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:r6_moovie_app/presenter/widgets/home/card_image.dart';

import '../stubs/stub.dart';

void main() {
  Future<void> buildApp(
      WidgetTester tester,
      dynamic media,
      ) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: false),
          home: Scaffold(
            body: CardImage(media: media),
          ),
        ),
      );

      await tester.pumpAndSettle();
    });
  }

  group('CardImageWidget movie', () {
    testWidgets('Should render card image widget', (tester) async {
      final dynamic media = moviesMock;
      await buildApp(tester, media);
      expect(find.byType(Image), findsOneWidget);
    });
  });

  group('CardImageWidget series', () {
    testWidgets('Should render  series card image widget', (tester) async {
      final dynamic media = seriesMock;
      await buildApp(tester, media);
      expect(find.byType(Image), findsOneWidget);
    });
  });
}