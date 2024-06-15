import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r6_moovie_app/presenter/widgets/home/nav_bar_main.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';

void main() {
  testWidgets('NavBarMain Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: NavBarMain(),
      ),
    ));

    // Verificar se todos os itens de navegação estão presentes.
    expect(find.text(AppStrings.home), findsOneWidget);
    expect(find.text(AppStrings.myProfile), findsOneWidget);
    expect(find.text(AppStrings.populars), findsOneWidget);
    expect(find.text(AppStrings.recommended), findsOneWidget);
    expect(find.text(AppStrings.myFavorites), findsOneWidget);
    expect(find.text(AppStrings.about), findsOneWidget);
     });
}
