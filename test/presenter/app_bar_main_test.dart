import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r6_moovie_app/presenter/widgets/home/app_bar_main.dart';

void main() {
  Future<void> buildApp(WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: AppBarMain(),
        ),
      ),
    );

    await tester.pumpAndSettle();
  }

  group('AppBarMain Tests', () {
    testWidgets('AppBarMain has a logo', (WidgetTester tester) async {
      // Arrange
      await buildApp(tester);

      // Act
      await tester.pump();

      // Assert
      expect(find.byWidgetPredicate(
              (widget) => widget is SvgPicture && widget.semanticsLabel == 'KoruFlix Logo',
        ), findsOneWidget);

      await expectLater(
        find.byType(IconButton),
        matchesGoldenFile('golden_image/app_bar_main_logo.png'),
      );
    });

    testWidgets('AppBarMain has an account icon', (WidgetTester tester) async {
     // Arrange
      await buildApp(tester);

      // Act
      await tester.pump();

      // Assert
      expect(find.byType(IconButton),
          findsOneWidget);

    });
  });
}
