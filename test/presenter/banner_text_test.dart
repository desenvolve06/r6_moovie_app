import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r6_moovie_app/presenter/widgets/home/banner_text.dart';
import 'package:r6_moovie_app/resources/app_values.dart';

void main() {
  //
  testWidgets('BannerText widget test', (WidgetTester tester) async {
   // Arrange
    const String title = 'Test Title';

    // Act
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: BannerText(title: title),
      ),
    ));

    // Assert
    expect(find.text(title), findsOneWidget);

    final textStyle = tester.widget<Text>(find.byType(Text)).style;
    expect(textStyle?.fontSize, equals(AppSize.s20));
    expect(textStyle?.fontWeight, equals(FontWeight.bold));

    final textWidget = tester.widget<Text>(find.byType(Text));
    expect(textWidget.maxLines, equals(2));
    expect(textWidget.overflow, equals(TextOverflow.ellipsis));
  });
}
