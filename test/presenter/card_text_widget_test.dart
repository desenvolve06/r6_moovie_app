import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r6_moovie_app/presenter/widgets/home/card_text.dart';

import '../stubs/stub.dart';

void main() {
  Future<void> buildApp(
      WidgetTester tester, dynamic media) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: false),
        home: Scaffold(
          body: CardText(
            media: media,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
  }

  group('CardTextWidget:', () {
    testWidgets('Should render movie card text widget', (tester) async {
      final dynamic testMedia = movieMock;
      await buildApp(tester, testMedia);

      final textWidget = find.descendant(of: find.byType(CardText),
        matching: find.byType(Text),
      );

      expect(textWidget, findsOneWidget);
      expect((tester.widget(textWidget) as Text).data, 'Godzilla');

      final textStyle = (tester.widget(textWidget) as Text).style;
      expect(textStyle?.color, Colors.white);
      expect(textStyle?.fontWeight, FontWeight.bold);


      final container = tester.widget<Container>(find.byType(Container));
      expect(container.decoration, BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ));

      expect(container.padding, const EdgeInsets.all(8.0));
    });
  });

  group('CardTextWidget:', () {
    testWidgets('Should render series card text widget', (tester) async {
      final dynamic testMedia = seriesMock;
      await buildApp(tester, testMedia);

      final textWidget = find.descendant(of: find.byType(CardText),
        matching: find.byType(Text),
      );

      expect(textWidget, findsOneWidget);
      expect((tester.widget(textWidget) as Text).data, 'Mad');

      final textStyle = (tester.widget(textWidget) as Text).style;
      expect(textStyle?.color, Colors.white);
      expect(textStyle?.fontWeight, FontWeight.bold);


      final container = tester.widget<Container>(find.byType(Container));
      expect(container.decoration, BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ));

      expect(container.padding, const EdgeInsets.all(8.0));
    });
  });
}
