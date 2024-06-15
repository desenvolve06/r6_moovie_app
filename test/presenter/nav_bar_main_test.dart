import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r6_moovie_app/presenter/widgets/home/nav_bar_main.dart';
import 'package:r6_moovie_app/resources/app_colors.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';
import 'package:r6_moovie_app/resources/app_values.dart';

void main() {
  testWidgets('NavBarMain Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: NavBarMain(),
      ),
    ));

    final List<String> navItems = [
      AppStrings.home,
      AppStrings.myProfile,
      AppStrings.populars,
      AppStrings.recommended,
      AppStrings.myFavorites,
      AppStrings.about,
    ];

    for (final item in navItems) {
      final Finder navItemFinder = find.text(item);

      // Verify if the navigation item is present
      expect(navItemFinder, findsOneWidget);
    }

    await tester.tap(find.text(AppStrings.myFavorites));
    await tester.pumpAndSettle();
  });
}
