import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r6_moovie_app/presenter/widgets/home/banner_text.dart';

void main() {
  testWidgets('BannerText widget test', (WidgetTester tester) async {
    const String title = 'Test Title';

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: BannerText(title: title),
      ),
    ));

    expect(find.text(title), findsOneWidget);
  });
}
