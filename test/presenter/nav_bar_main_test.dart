import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:r6_moovie_app/presenter/widgets/home/nav_bar_main.dart';
import 'package:r6_moovie_app/resources/app_colors.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';
import 'package:r6_moovie_app/resources/app_values.dart';

void main() {
  Widget buildMaterialApp(Widget child) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        body: child,
      ),
    );
  }

  setUpAll(() async {
    await loadAppFonts();
  });

  group('NavBarMain Tests', () {
    testWidgets('Should render nav Items texts', (WidgetTester tester) async {
      await tester.pumpWidget(buildMaterialApp(const NavBarMain()));

      final List<String> navItems = [
        AppStrings.home,
        AppStrings.myProfile,
        AppStrings.populars,
        AppStrings.recommended,
        AppStrings.myFavorites,
        AppStrings.about,
      ];

      for (final item in navItems) {
        verifyNavItemStyle(tester, item, AppSize.s30.toDouble(),
            AppColors.primaryColor, FontWeight.bold);
      }
    });

    testGoldens('Should render Golden Test nav item ',
        (WidgetTester tester) async {
      await tester.pumpWidgetBuilder(buildMaterialApp(const NavBarMain()));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(NavBarMain),
        matchesGoldenFile('golden_image/nav_bar_main.png'),
      );
    });
  });
}

void verifyNavItemStyle(
  WidgetTester tester,
  String item,
  double expectedFontSize,
  Color expectedColor,
  FontWeight expectedFontWeight,
) {
  final Finder navItemFinder = find.text(item);

  expect(navItemFinder, findsOneWidget);

  final textWidget = tester.widget<Text>(navItemFinder);
  expect(textWidget.style!.fontSize, equals(expectedFontSize));
  expect(textWidget.style!.color, equals(expectedColor));
  expect(textWidget.style!.fontWeight, equals(expectedFontWeight));
}
