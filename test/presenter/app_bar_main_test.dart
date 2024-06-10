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
    testWidgets('AppBarMain has a logo and an account icon', (WidgetTester tester) async {
      // Build the AppBarMain widget
      await buildApp(tester);

      // Verify if the logo is present
      expect(find.byWidgetPredicate(
              (widget) => widget is SvgPicture && widget.semanticsLabel == 'KoruFlix Logo'
      ), findsOneWidget);

      // Verify if the account icon is present
      expect(find.byIcon(Icons.account_circle), findsOneWidget);
    });
  });
}
